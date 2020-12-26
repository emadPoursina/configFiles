const { exec } = require("child_process");

function shell(command) {
	return new Promise((resolve, reject) => {
		exec(command, (err, result) => { resolve(result); reject(new Error(err)); });
	});
}

console.log("{ \"version\": 1 }");

console.log("[");

console.log("[],");

async function barGenerator() {
	const date = await shell("date");
	const acpi = await shell("acpi");
	const sizeStorage = await shell("df -H / | awk '{print $4}' | grep G");
	const cpuUsage = await shell("mpstat  | awk '{print $4}' | awk 'NR==4'");

	console.log(
		`[
			{
				"name": "cpuUsage",
				"full_text": "CPU: ${cpuUsage.trim()}"
			},
			{
				"name": "battryStatus",
				"full_text": "BAT: ${acpi.substr(24, 14)}"
			},
			{
				"name": "sizeStorage",
				"full_text": "SDA: ${sizeStorage.trim()}"
			},
			{
				"name": "time",
				"full_text": "${date.trim()}"
			}
		],`
	);
}

setInterval(barGenerator, 1000);
