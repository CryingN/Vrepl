module shell

struct CmdOption {
    abbr        string
    full        string
    desc        string
}

// Defined option
fn (long_option CmdOption) set_options(args []string) bool {
        mut flags := false
        for v in args {
                if v in [long_option.abbr, long_option.full] {
                        flags = true
                }
        }
        return flags
}
