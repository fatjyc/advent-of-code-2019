#!/usr/bin/env bash

if [ -n "$1" ]; then
    mkdir $1
    cd $1
    cat << EOF >> $1.rb
#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-



EOF
    chmod +x $1.rb

    touch input
    cd ..
fi