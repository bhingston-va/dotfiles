#!/bin/bash

# Copyright (c) 2013 Aaron Lasseigne
#
# Permission is hereby granted, free of charge, to any person
# obtaining a copy of this software and associated documentation
# files (the "Software"), to deal in the Software without
# restriction, including without limitation the rights to use,
# copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following
# conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
# OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
# WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.

HEART='♥ '

if [[ `uname` == 'Linux' ]]; then
  current_charge=$(cat /proc/acpi/battery/BAT1/state | grep 'remaining capacity' | awk '{print $3}')
  total_charge=$(cat /proc/acpi/battery/BAT1/info | grep 'last full capacity' | awk '{print $4}')
else
  battery_info=`ioreg -rc AppleSmartBattery`
  current_charge=$(echo $battery_info | grep -o '"CurrentCapacity" = [0-9]\+' | awk '{print $3}')
  total_charge=$(echo $battery_info | grep -o '"MaxCapacity" = [0-9]\+' | awk '{print $3}')
fi

charged_slots=$(echo "(($current_charge/$total_charge)*100)" | bc -l | cut -d '.' -f 1)
#ones_place=$(echo "$charged_slots % 10" | bc)
#if [[ $ones_place -ge 5 ]]; then
#  charged_slots=$(echo "(($current_charge/$total_charge)*10)+1" | bc -l | cut -d '.' -f 1)
#else
#  charged_slots=$(echo "(($current_charge/$total_charge)*10)" | bc -l | cut -d '.' -f 1)
#fi
#if [[ $charged_slots -gt 10 ]]; then
#  charged_slots=10
#fi


if [[ $charged_slots -ge 98 ]]; then
  charged_slots=20
  echo -n '#[fg=green]'
elif [[ $charged_slots -ge 95 ]]; then
  charged_slots=19
  echo -n '#[fg=red]'
elif [[ $charged_slots -ge 90 ]]; then
  charged_slots=18
  echo -n '#[fg=red]'
elif [[ $charged_slots -ge 85 ]]; then
  charged_slots=17
  echo -n '#[fg=red]'
elif [[ $charged_slots -ge 80 ]]; then
  charged_slots=16
  echo -n '#[fg=red]'
elif [[ $charged_slots -ge 75 ]]; then
  charged_slots=15
  echo -n '#[fg=red]'
elif [[ $charged_slots -ge 70 ]]; then
  charged_slots=14
  echo -n '#[fg=red]'
elif [[ $charged_slots -ge 65 ]]; then
  charged_slots=13
  echo -n '#[fg=red]'
elif [[ $charged_slots -ge 60 ]]; then
  charged_slots=12
  echo -n '#[fg=red]'
elif [[ $charged_slots -ge 55 ]]; then
  charged_slots=11
  echo -n '#[fg=red]'
elif [[ $charged_slots -ge 50 ]]; then
  charged_slots=10
  echo -n '#[fg=yellow]'
elif [[ $charged_slots -ge 45 ]]; then
  charged_slots=9
  echo -n '#[fg=yellow]'
elif [[ $charged_slots -ge 40 ]]; then
  charged_slots=8
  echo -n '#[fg=yellow]'
elif [[ $charged_slots -ge 35 ]]; then
  charged_slots=7
  echo -n '#[fg=yellow]'
elif [[ $charged_slots -ge 30 ]]; then
  charged_slots=6
  echo -n '#[fg=blue]'
elif [[ $charged_slots -ge 25 ]]; then
  charged_slots=5
  echo -n '#[fg=blue]'
elif [[ $charged_slots -ge 20 ]]; then
  charged_slots=4
  echo -n '#[fg=blue,blink]'
elif [[ $charged_slots -ge 15 ]]; then
  charged_slots=3
  echo -n '#[fg=blue,blink]'
elif [[ $charged_slots -ge 10 ]]; then
  charged_slots=2
elif [[ $charged_slots -ge 05 ]]; then
  charged_slots=1
  echo -n '#[fg=blue,blink]'
fi

#ratio=$(echo "$current_charge/$total_charge" | bc)
#if [[ $ratio -ge 1]]; then
#  echo -n '#[fg=green]'
#else
#  echo -n '#[fg=red]'
#fi

#echo -n '#[fg=red]'
for i in `seq 1 $charged_slots`; do echo -n "$HEART"; done

if [[ $charged_slots -lt 20 ]]; then
  echo -n '#[fg=cyan]'
  for i in `seq 1 $(echo "20-$charged_slots" | bc)`; do echo -n "$HEART"; done
fi
