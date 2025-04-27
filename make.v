module main

import shell { start }
import os { system }

const version := 'v0.0.1'
const vexe := @VEXE
const vrepl_path := vexe[0..vexe.len-1] + 'cmd/tools/vrepl'
const vrepl := vrepl_path + '.v'

// console
fn main() {
	data := start(version)
	match data {
		'-u' {
			update()
		}
		'-c' {
			clean()
		}
		else {
			println('neko')
		}
	}
}

// update Vrepl
fn update() {
	system('git pull')
	system('v vrepl.v -o ${vrepl_path}')
}

// clean()
fn clean() {
	system('v ${vrepl}')
}

