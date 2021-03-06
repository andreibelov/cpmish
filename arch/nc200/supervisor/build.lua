include "third_party/zmac/build.lua"

normalrule {
    name = "keytab_inc",
    ins = { "arch/nc200/utils+mkkeytab" },
    outleaves = { "keytab.inc" },
    commands = {
        "%{ins} > %{outs}"
    }
}

normalrule {
    name = "font_inc",
    ins = {
        "arch/nc200/utils+fontconvert",
        "utils/6x7font.bdf"
    },
    outleaves = { "font.inc" },
    commands = {
        "%{ins} > %{outs}"
    }
}

zmac {
    name = "supervisor",
    srcs = { "./supervisor.z80" },
    deps = {
        "include/*.lib",
        "arch/common/utils/deblocker.lib",
        "arch/common/utils/tty.lib",
        "arch/nc200/include/*.lib",
        "arch/nc200+addresses_lib",
        "./*.inc",
        "+keytab_inc",
        "+font_inc",
    },
}

zmac {
    name = "variables",
    srcs = { "./variables.z80" },
    deps = {
        "include/*.lib",
        "arch/nc200/include/*.lib",
        "+font_inc",
    },
}
