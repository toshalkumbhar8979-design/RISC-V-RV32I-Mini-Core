# RISC-V RV32I Mini Core
A lightweight, synthesizable RISC-V integer core optimized for the Xilinx Artix-7 FPGA (Basys 3). This project demonstrates a functional RISC-V pipeline integrated with a multiplexed 7-segment display driver for real-time hardware debugging.

## Hardware Implementation Results
The following metrics were captured after full Synthesis, Implementation, and Bitstream generation in Vivado 2016.1. These values confirm that the design meets timing constraints for a 100MHz clock.

| Metric | Verified Value |
| :--- | :--- |
| **Target Device** | Artix-7 (xc7a35tcpg236-1) |
| **Clock Frequency** | 100 MHz |
| **Worst Negative Slack (WNS)** | 7.586 ns |
| **Worst Hold Slack (WHS)** | 0.252 ns |
| **Total On-Chip Power** | 0.075 W |
| **Slice LUTs** | 3 |
| **Design Registers (FF)** | 20 |



## Repository Structure
The project is organized according to industry standards for RTL development:

- `design_sources/`: Contains the synthesizable Verilog files (`riscv_mini_core.v`, `instruction_mem.v`, `hex_to_7seg.v`).
- `simulation_sources/`: Contains the testbench (`tb_riscv_core.v`) for functional verification.
- `constraints/`: Physical pin mapping and timing constraints (`basys3_riscv.xdc`).
- `docs/`: Detailed timing and power reports exported directly from Vivado.
- `mem/`: Instruction memory initialization files.

## Features
- **RV32I Base Instruction Set:** Supports fundamental integer operations.
- **Optimized Resource Usage:** Extremely low LUT footprint (3 LUTs) for basic ALU operations.
- **Hardware Debugging:** Integrated `hex_to_7seg` module to visualize the ALU result on the Basys 3 hardware.
- **Silicon-Ready Documentation:** Includes full timing closure and power analysis reports.

## How to Run
1. Open Xilinx Vivado.
2. Add the files from `design_sources/` and the constraint file from `constraints/`.
3. Run **Implementation**.
4. A pre-compiled bitstream is available in the [Releases](../../releases) section for immediate flashing to a Basys 3 board.

---
**Developer:** Toshal Kumbhar  
**Focus:** Electronics and Communication Engineering | Digital Logic Design
