#!/usr/bin/env rust-script
//! Dependencies can be specified in the script file itself as follows:
//!
//! ```cargo
//! [dependencies]
//!
//! ```

use std::collections::HashMap;
use std::process::Command;

#[derive(Debug, Clone)]
struct SelectCommand {
    mac: String,
    state: String,
}

fn main() {
    let _ = Command::new("bluetoothctl").arg("power").arg("on").output();
    let _ = Command::new("bluetoothctl")
        .arg("pairable")
        .arg("on")
        .output();

    let output = Command::new("bluetoothctl")
        .arg("devices")
        .output()
        .expect("failed to execute bluetoothctl");

    let devices_output =
        std::str::from_utf8(&output.stdout).expect("failed to retrieve bluetoothctl output");

    let devices = devices_output
        .split('\n')
        .collect::<Vec<&str>>()
        .into_iter()
        .filter(|v| !v.is_empty());

    let mut options: String = "".to_string();
    let mut map: HashMap<String, SelectCommand> = HashMap::new();

    for d in devices {
        let text = d.split(" ").collect::<Vec<&str>>();
        let mac = &text.get(1).expect("failed to get MAC address");
        let name = (&text[2..]).join(" ");
        let is_connected_raw_output = Command::new("bluetoothctl")
            .arg("info")
            .arg(&mac)
            .output()
            .expect("failed to check if device is connected");

        let is_connected = std::str::from_utf8(&is_connected_raw_output.stdout)
            .expect("failed to retrieve bluetoothctl info output")
            .find("Connected: yes");

        let state: &str;
        let initial_text = match is_connected {
            Some(_) => {
                state = "disconnect";
                " Disconnect from"
            }
            None => {
                state = "connect";
                " Connect to"
            }
        };

        let line = format!("{} {}", initial_text, name);
        options.push_str(&line);
        options.push_str("\n");

        map.insert(
            line.to_string(),
            SelectCommand {
                mac: mac.to_string(),
                state: state.to_string(),
            },
        );
    }

    let echo_cmd = Command::new("echo")
        .arg(&options)
        .stdout(std::process::Stdio::piped())
        .spawn()
        .unwrap();

    let selected = Command::new("rofi")
        .arg("-dmenu")
        .arg("-p")
        .arg("Bluetooth")
        .stdin(std::process::Stdio::from(echo_cmd.stdout.unwrap()))
        .stdout(std::process::Stdio::piped())
        .output()
        .expect("failed to execute bluetoothctl");

    let selected_text = std::str::from_utf8(&selected.stdout)
        .expect("failed to retrieve selected text from lofi")
        .replace('\n', "");

    let result = &map.get(&selected_text).expect("failed to get result");

    let _ = Command::new("bluetoothctl")
        .arg(&result.state)
        .arg(&result.mac)
        .output();
}
