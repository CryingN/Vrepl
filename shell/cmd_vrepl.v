module shell

import os

pub fn start(version string) string {
        long_options := [
                CmdOption{
                        abbr: '-h'
                        full: '-help'
                        desc: 'Show basic help message and exit.'
                },
                CmdOption{
                        abbr: '-v'
                        full: '--version'
                        desc: 'Show version and exit.'
                },
		CmdOption{
                        abbr: '-u'
                        full: '--up'
                        desc: 'Update vlang & Vrepl.'
                },
		CmdOption{
                        abbr: '-c'
                        full: '--clean'
                        desc: 'Restore original vrepl.'
                },

        ]

        mut args := os.args.clone()
	mut start_set := ''

        // -h or --help
        if long_options[0].set_options(args) {
                help(long_options, version)
                exit(1)
        }

        // -v or --version
        if long_options[1].set_options(args) {
                println('Vrepl ${version}')
                exit(1)
        }
	
	// -u or --up
	if long_options[2].set_options(args) {
        	start_set = '-u'
	}

	// -c or --clean
	if long_options[3].set_options(args) {
		if start_set != '' {
			the_choose := os.input('${set_log}Multiple "option" elements have been detected, cleanup is needed?(Y/n)')
			if !(the_choose in choose_true) {
				exit(1)
			}
		}
		start_set = '-c'
	}

	return start_set
}

// -h or --help
fn help(long_options []CmdOption, version string) {
    mut data := 'Vrepl ${version}, By: CryingN.'
    data += '\nBasic usages:'
    data += '\n v run make.v [Options]'
    data += '\n v make.v; ./make [Options]'
    data += '\nOptions:'
    println(data)

    for v in long_options {
        data = ' ${v.abbr}, ${v.full}'
        data_len := data.len
        for _ in 0..(5 - (data_len / 8)) {
            data += '\t'
        }
        data += '${v.desc}'
        println(data)
    }
}
