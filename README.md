# RISC-V RV32I Mini Core
A lightweight, synthesizable RISC-V integer core optimized for the Artix-7 FPGA (Basys 3).

## Implementation Results (Verified)
The following metrics were captured after full Implementation and Bitstream generation in Vivado:

| Metric | Value |
| :--- | :--- |
| **Clock Frequency** | 100 MHz |
| **Worst Negative Slack (WNS)** | 7.586 ns |
| **Worst Hold Slack (WHS)** | 0.252 ns |
| **Total On-Chip Power** | 0.075 W |
| **LUT Utilization** | 3 LUTs |
| **Register Utilization** | 20 FFs |

## Project Structure
* `/src`: Verilog source files for the core and 7-segment driver.
* `/constraints`: XDC file for Basys 3 pin mapping.
* `/reports`: Full Vivado Timing and Power reports.

## Hardware Verification
The core's ALU output is mapped to the onboard 7-segment display using a multiplexed driver to allow for real-time hardware debugging.
