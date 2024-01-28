const shell = require("shelljs");

const modules = [
	{ name: "MMM-BackgroundSlideshow", url: "https://github.com/darickc/MMM-BackgroundSlideshow" },
	{ name: "MMM-soccer", url: "https://github.com/Adrish-ASProg/MMM-soccer" },
	{ name: "MMM-SmartTouch", url: "https://github.com/EbenKouao/MMM-SmartTouch" },
];

modules.forEach(module => installModule(module.name, module.url));

function installModule(name, url) {
	if (shell.test("-e", `./modules/${name}`)) {
		console.log(`${name} already installed.`);
		return;
	}

	console.log(`Installing ${name}..`);

	exec(`git clone ${url} --quiet ./modules/${name}`);
	shell.cd(`./modules/${name}`);

	exec("npm install --quiet --silent");
	shell.cd(`-`);
}

function exec(command) {
	if (shell.exec(command).code !== 0) {
		console.error(`Command exited with error: ${command}`);
		shell.exit(1);
	}
}
