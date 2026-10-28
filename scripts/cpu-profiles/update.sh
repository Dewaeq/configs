#!/bin/sh
# Installs these CPU profiles to /etc/auto-cpufreq/ and re-applies the active one.
# Run with sudo after editing a profile. ~/scripts/cpu-mode switches between them
# through this rule in /etc/sudoers.d/cpu-profile (create it with visudo -f):
#   Cmnd_Alias CPU_PROFILE = /usr/bin/cp /etc/auto-cpufreq/saver.conf /etc/auto-cpufreq.conf, /usr/bin/cp /etc/auto-cpufreq/balanced.conf /etc/auto-cpufreq.conf, /usr/bin/cp /etc/auto-cpufreq/performance.conf /etc/auto-cpufreq.conf
#   dewaeq ALL=(root) NOPASSWD: CPU_PROFILE
set -e
cd "$(dirname "$0")"
active=$(sed -n '1s/^# \([a-z]*\):.*/\1/p' /etc/auto-cpufreq.conf)
install -d -m 755 /etc/auto-cpufreq
install -m 644 saver.conf balanced.conf performance.conf /etc/auto-cpufreq/
cp "/etc/auto-cpufreq/${active:-balanced}.conf" /etc/auto-cpufreq.conf
echo "updated, active: ${active:-balanced}"
