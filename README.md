# RISC-V RV32I Mini Core
A lightweight, synthesizable RISC-V integer core optimized for the Xilinx Artix-7 FPGA (Basys 3). This project demonstrates a functional 3-stage RISC-V pipeline with strict resource management and optimized power profiles.

## Hardware Implementation Results
The following metrics were captured after full Synthesis, Implementation, and Bitstream generation in Vivado 2026. These values confirm that the design meets timing constraints for a 50MHz clock cycle (20ns period).

| Metric | Verified Value |
| :--- | :--- |
| **Target Device** | Artix-7 (xc7a35tcpg236-1) |
| **Synthesis LUT Count** | 360 |
| **Implementation LUT Count** | 201 |
| **Design Registers (FF)** | 630 |
| **Worst Negative Slack (WNS)** | 14.427 ns |
| **Worst Hold Slack (WHS)** | 0.168 ns |
| **Total On-Chip Power** | 0.076 W |

Visual Documentation
---

### Device View
The Device View shows the physical floorplanning of the RISC-V core on the Artix-7 XC7A35T silicon. The highlighted regions represent the active Configurable Logic Blocks (CLBs) and routing resources used by the pipeline, confirming a successful placement and routing (P&R) phase.

<img width="321" height="466" alt="image" src="https://github.com/user-attachments/assets/59e2284d-fa69-46bb-b826-44018b6d7b7b" />

---
### RTL Schematic
The schematic below illustrates the synthesized microarchitecture, featuring the 3-stage pipeline (Fetch, Decode, Execute) and the General Purpose Register (GPR) file. The clear separation of modules ensures minimal propagation delay and stable timing closure.

<img width="976" height="307" alt="image" src="https://github.com/user-attachments/assets/53c88c33-fc2d-4623-8095-658be5d5e647" />

---
### Power Analysis
The design demonstrates an extremely efficient power profile. Total on-chip power is verified at 0.076 W, with 97% consisting of Device Static power, ensuring the internal switching logic is stable.

<img width="499" height="249" alt="image" src="https://github.com/user-attachments/assets/3517c8d4-aa67-418c-89ca-bc7a2aa01599" />


---
### Timing Summary
With a Worst Negative Slack (WNS) of 14.427 ns, this core easily meets timing constraints, providing significant headroom for future instruction set expansions.

<img width="653" height="222" alt="image" src="https://github.com/user-attachments/assets/4e7cfb15-1385-417e-9e44-9022707de78c" />

---

## Repository Structure
The project is organized according to industry standards for RTL development:

- `design_sources/`: Contains the synthesizable Verilog files (`riscv_mini_core.v`, `GPR_MEMORY.v`, `fetch.v`, `decode.v`, `execute.v`).
- `simulation_sources/`: Contains the testbenches for functional verification.
- `constraints/`: Physical pin mapping (Basys 3) and timing constraints (`basys3_riscv.xdc`).
- `docs/`: Detailed timing, power, and utilization reports exported directly from Vivado.

## Features
- **3-Stage Pipeline:** Optimized Fetch, Decode, and Execute stages for efficient instruction processing.
- **Synchronous Memory Architecture:** Utilizes edge-triggered ROM and General Purpose Registers (GPR) to ensure stable hardware synthesis and prevent timing violations.
- **Pruning Protection:** Leverages `DONT_TOUCH` attributes to ensure the full microarchitecture is preserved by the Vivado optimizer.
- **Low-Power Profile:** Verified at 0.076W, making it ideal for embedded or edge applications.

## How to Run
1. Open Xilinx Vivado.
2. Add the files from `design_sources/` and the constraint file from `constraints/`.
3. Run **Implementation**.
4. Open the **Implemented Design** to verify the Power and Timing reports match the values above.
5. A pre-compiled bitstream is available in the [Releases](../../releases) section for immediate flashing to a Basys 3 board.

---
**Developer:** Toshal Kumbhar  
**Focus:** Electronics and Communication Engineering | Digital Logic Design
