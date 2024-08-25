configure_openwrt() {
    local config_file="/etc/config/config-uci.conf"
    
    echo "Configuring OpenWrt using ${config_file}..."

    . "${config_file}"

    uci set system.@system[0].hostname="$hostname"
    uci set network.lan.ipaddr="$static_ip"
    uci set network.lan.netmask="$subnet_mask"
    uci set network.lan.gateway="$gateway"
    uci set dhcp.lan.start="$dhcp_start_range"
    uci set dhcp.lan.limit="$dhcp_end_range"
    uci set wireless.@wifi-iface[0].ssid="$wifi_ssid"
    uci set wireless.@wifi-iface[0].key="$wifi_password"
    uci commit

    echo "Configuration applied successfully."
}


validate_config() {
    echo "Validating configuration..."

    if [ -z "$static_ip" ] || [ -z "$subnet_mask" ] || [ -z "$gateway" ]; then
        echo "Error: Missing required network configuration."
        exit 1
    fi

    if ! echo "$static_ip" | grep -qE '^([0-9]{1,3}\.){3}[0-9]{1,3}$'; then
        echo "Error: Invalid IP address format for static_ip."
        exit 1
    fi

    if ! echo "$subnet_mask" | grep -qE '^255\.[0-9]+\.[0-9]+\.[0-9]+$'; then
        echo "Error: Invalid subnet mask format."
        exit 1
    fi

    if ! echo "$gateway" | grep -qE '^([0-9]{1,3}\.){3}[0-9]{1,3}$'; then
        echo "Error: Invalid gateway format."
        exit 1
    fi

    echo "Configuration validated successfully."
}

run_wizard() {
    echo "Starting OpenWrt configuration wizard..."

    validate_config

    configure_openwrt

    echo "Wizard completed successfully."
}

run_wizard
