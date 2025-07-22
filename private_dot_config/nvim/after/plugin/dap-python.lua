require('dap-python').setup()

require('dap').configurations.python = {
	{
		type = 'python';
		request = 'launch';
		name = "Launch file";
		program = "${file}";
		pythonPath = function()
			return '/usr/bin/python'
		end;
	},
}
