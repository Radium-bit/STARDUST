#!/system/bin/sh
# Author: STARDUST3574 (Radium-bit)
# Platform: msm8953
# Generated at: 2019

CUR_LEVEL_FILE="/dev/.8953_cur_level"
PARAM_BAK_FILE="/dev/.8953_param_bak"

# const variables
PARAM_NUM=26

# sysfs_objx example:
# sysfs_obj1="${C0_GOVERNOR_DIR}/target_loads"
SCHED_DIR="/proc/sys/kernel"
C0_GOVERNOR_DIR="/sys/devices/system/cpu/cpufreq/interactive"
GPU_DIR="/sys/class/kgsl/kgsl-3d0/devfreq"
A_ELDER="/sys/module/adreno_idler/parameters"
C_WLAYOUT="/sys/module/workqueue/parameters"
C0_DIR="/sys/devices/system/cpu/cpu0"
C4_DIR="/sys/devices/system/cpu/cpu4"
C5_DIR="/sys/devices/system/cpu/cpu5"
C6_DIR="/sys/devices/system/cpu/cpu6"
C7_DIR="/sys/devices/system/cpu/cpu7"

sysfs_obj1="/sys/module/msm_thermal/core_control/enabled"
sysfs_obj2="/sys/module/msm_thermal/parameters/enabled"
sysfs_obj3="/sys/module/msm_performance/parameters/cpu_min_freq"
sysfs_obj4="/sys/module/msm_performance/parameters/cpu_max_freq"
sysfs_obj5="${C0_DIR}/online"
sysfs_obj6="${C4_DIR}/online"
sysfs_obj7="${C5_DIR}/online"
sysfs_obj8="${C6_DIR}/online"
sysfs_obj9="${C7_DIR}/online"
sysfs_obj10="${C0_DIR}/cpufreq/scaling_governor"
sysfs_obj11="${C0_DIR}/cpufreq/scaling_min_freq"
sysfs_obj12="${C0_DIR}/cpufreq/scaling_max_freq"
sysfs_obj13="${C0_GOVERNOR_DIR}/hispeed_freq"
sysfs_obj14="${C0_GOVERNOR_DIR}/go_hispeed_load"
sysfs_obj15="${C0_GOVERNOR_DIR}/min_sample_time"
sysfs_obj16="${C0_GOVERNOR_DIR}/above_hispeed_delay"
sysfs_obj17="${C0_GOVERNOR_DIR}/target_loads"
sysfs_obj18="${C0_GOVERNOR_DIR}/timer_rate"
sysfs_obj19="${C0_GOVERNOR_DIR}/timer_slack"
sysfs_obj20="${GPU_DIR}/max_gpuclk"
sysfs_obj21="${GPU_DIR}/governor"
sysfs_obj22="${A_ELDER}/adreno_idler_active"
sysfs_obj23="${A_ELDER}/adreno_idler_idleworkload"
sysfs_obj24="${A_ELDER}/adreno_idler_downifferential"
sysfs_obj25="/sys/block/mmcblk0/queue/rq_affinity"
sysfs_obj26="${C_WLAYOUT}/power_efficient"

# LV0 -- POWERSAVE
level0_val1="1"
level0_val2="Y"
level0_val3=""
level0_val4=""
level0_val5="1"
level0_val6="0"
level0_val7="0"
level0_val8="0"
level0_val9="0"
level0_val10="interactive"
level0_val11="628000"
level0_val12="1401600"
level0_val13="1401600"
level0_val14="89"
level0_val15="13000"
level0_val16="18000"
level0_val17="65 1036800:90"
level0_val18="20000"
level0_val19="1000"
level0_val20="400000000"
level0_val21="msm-adreno-tz"
level0_val22="Y"
level0_val23="10000"
level0_val24="50"
level0_val25="1"
level0_val2="Y"

# LV1 -- BALANCE
level1_val1="1"
level1_val2="Y"
level1_val3=""
level1_val4=""
level1_val5="1"
level1_val6="1"
level1_val7="1"
level1_val8="1"
level1_val9="0"
level1_val10="interactive"
level1_val11="652800"
level1_val12="1689600"
level1_val13="1401600"
level1_val14="65"
level1_val15="33000"
level1_val16="20000"
level1_val17="60 1036800:75 1401600:85 1689600:90"
level1_val18="20000"
level1_val19="1000"
level1_val20="510000000"
level1_val21="msm-adreno-tz"
level1_val22="Y"
level1_val23="7000"
level1_val24="20"
level1_val25="1"
level0_val26="Y"

# LV2 --PERFORMANCE
level2_val1="0"
level2_val2="N"
level2_val3=""
level2_val4=""
level2_val5="1"
level2_val6="1"
level2_val7="1"
level2_val8="1"
level2_val9="1"
level2_val10="interactive"
level2_val11="1036800"
level2_val12="1958400"
level2_val13="1804800"
level2_val14="95"
level2_val15="30000"
level2_val16="1680000"
level2_val17="40 1576900:66 1766420:78 1874315:90 1958400"
level2_val18="20000"
level2_val19="180000"
level2_val20="650000000"
level2_val21="msm-adreno-tz"
level2_val22="Y"
level2_val23="2000"
level2_val24="6"
level2_val25="2"
level0_val26="N"


# LV 3 -FAST
level3_val1="0"
level3_val2="N"
level3_val3=""
level3_val4=""
level3_val5="1"
level3_val6="1"
level3_val7="1"
level3_val8="1"
level3_val9="1"
level3_val10="perfromance"
level3_val11="2016000"
level3_val12="2016000"
level3_val13="198000"
level3_val14=""
level3_val15="20000"
level3_val16=""
level3_val17="0"
level3_val18="0"
level3_val19="0"
level3_val20="650000000"
level3_val21="perfromance"
level3_val22="N"
level3_val23="2000"
level3_val24="1"
level3_val25="2"
level0_val26="N"


# global variables
HAS_BAK=0
NOT_MATCH_NUM=0

# $1:value $2:file path
lock_value() 
{
	if [ -f ${2} ]; then
		chmod 0666 ${2}
		echo ${1} > ${2}
		chmod 0666 ${2}
	fi
}

# $1:level_number 
apply_level() 
{
	# 0. SELinux permissive
	setenforce 0
    # 1. backup  
    backup_default
    # 2. apply modification 
    for n in `seq ${PARAM_NUM}`
    do
        eval obj="$"sysfs_obj${n}
        eval val="$"level${1}_val${n}
        lock_value "${val}" ${obj}
    done
    # 3. save current level to file 
    echo ${1} > ${CUR_LEVEL_FILE}
}

# $1:value $2:file path
check_value() 
{
    if [ -f ${2} ]; then
        expected="${1}"
        actual="`cat ${2}`"
        if [ "${actual}" != "${expected}" ]; then
            # input_boost_freq has a additional line break
            case1=$(echo "${actual}" | grep "${expected}")
            case2=$(echo "${2}" | grep "scaling_")
            if [ "${case1}" == "" ] && [ "${case2}" == "" ]; then
                NOT_MATCH_NUM=$(expr ${NOT_MATCH_NUM} + 1)
                echo "[FAIL] ${2}"
                echo "expected: ${expected}"
                echo "actual: ${actual}"
            fi
        fi
    else
        echo "[IGNORE] ${2}"
    fi
}

# $1:level_number
verify_level() 
{
    for n in `seq ${PARAM_NUM}`
    do
        eval obj="$"sysfs_obj${n}
        eval val="$"level${1}_val${n}
        check_value "${val}" ${obj}
    done
    echo "Verified ${PARAM_NUM} parameters, ${NOT_MATCH_NUM} FAIL"
}

backup_default()
{
    if [ ${HAS_BAK} -eq 0 ]; then
        # clear previous backup file
        echo "" > ${PARAM_BAK_FILE}
        for n in `seq ${PARAM_NUM}`
        do
            eval obj="$"sysfs_obj${n}
            echo "bak_obj${n}=${obj}" >> ${PARAM_BAK_FILE}
            echo "bak_val${n}=\"`cat ${obj}`\"" >> ${PARAM_BAK_FILE}
        done
        echo "Backup default parameters has completed."
    else
        echo "Backup file already exists, skip backup."
    fi
}

restore_default()
{
    if [ -f ${PARAM_BAK_FILE} ]; then
        # read backup variables
        while read line
        do
            eval ${line}
        done < ${PARAM_BAK_FILE}
        # set backup variables
        for n in `seq ${PARAM_NUM}`
        do
            eval obj="$"bak_obj${n}
            eval val="$"bak_val${n}
            lock_value ${val} ${obj}
        done
        echo "Restore OK"
    else
        echo "Backup file for default parameters not found."
        echo "Restore FAIL"
    fi
}

permanently_disable_perfd()
{
    stop perfd
    perfd_path=`which perfd`
    if [ -n "${perfd_path}" ]; then
        mv ${perfd_path} `dirname ${perfd_path}`/perfd_bak
        echo "Perfd has been disabled."
    else
        echo "Perfd binary not found."
    fi
}

permanently_enable_perfd()
{
    perfd_bak_path=`which perfd_bak`
    if [ -n "${perfd_bak_path}" ]; then
        mv ${perfd_bak_path} `dirname ${perfd_bak_path}`/perfd
        echo "Perfd has been enabled."
    else
        echo "Perfd_bak binary not found."
    fi
    start perfd
}

# suppress stderr
(

echo ""

# backup runonce flag
if [ -f ${PARAM_BAK_FILE} ]; then
    HAS_BAK=1
fi

action=$1
# default option is balance
if [ ! -n "$action" ]; then
    action="balance"
fi

if [ "$action" = "debug" ]; then
	echo "STARDUST "
	echo "Author: STARDUST3574"
	echo "Platform: msm8953"
	echo "Generated at: 2019-6-29  01:48"
	echo "Feedback mailbox:3574503872@qq.com"
	echo ""
    # perform parameter verification
    cur_level=`cat ${CUR_LEVEL_FILE}`
	if [ -n "${cur_level}" ]; then
        echo "Current level: ${cur_level}"
        verify_level ${cur_level}
    else
        echo "Current level: not detected"
    fi
    echo ""
	exit 0
fi
  # Read parameters and execute
if [ "$action" = "restore" ]; then
	restore_default
fi

if [ "$action" = "powersave" ]; then
    echo "Applying powersave..."
    apply_level 0
    echo "Applying powersave done."
fi

if [ "$action" = "balance" ]; then
    echo "Applying balance..."
    apply_level 1
    echo "Applying balance done."
fi

if [ "$action" = "performance" ]; then
    echo "Applying performance..."
    apply_level 2
    echo "Applying performance done."
fi

if [ "$action" = "fast" ]; then
    echo "Applying fast..."
    apply_level 3
    echo "Applying fast done."
fi

if [ "$action" = "level" ]; then
    level=${2}
    if [ "${level}" -ge "0" ] && [ "${level}" -le "3" ]; then
        echo "Applying level ${level}..."
        apply_level ${level}
        echo "Applying level ${level} done."
    else
        echo "Level ${level} not supported."
    fi
fi

if [ "$action" = "perfd" ]; then
    cmd=${2}
    if [ "${cmd}" == "enable" ]; then
        permanently_enable_perfd
    fi
    if [ "${cmd}" == "disable" ]; then
        permanently_disable_perfd
    fi
fi

echo ""

# suppress stderr
) 2>/dev/null
# SELinux setence back, if you don't want change to "setenforce 0"
setenforce 1
exit 0
