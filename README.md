# 4-bit ALU – Verilog RTL Design
A 4-bit Arithmetic Logic Unit (ALU) designed and verified using Verilog HDL.

The ALU supports six arithmetic and bitwise operations selected using a 3-bit operation code. The design was simulated, exhaustively verified, synthesized, and implemented using AMD Xilinx Vivado.
---
## Project Highlights

- 4-bit combinational ALU
- 6 arithmetic and bitwise operations
- Exhaustive verification with 1,536 test cases
- 1,536/1,536 test cases passed
- Synthesized using AMD Xilinx Vivado 2023.2
- 6 Slice LUTs and 2 Slices utilized
- Successfully placed and routed
---

## Operations

| Option | Operation |
|--------|-----------|
| `000`  | ADD       |
| `001`  | SUBTRACT  |
| `010`  | AND       |
| `011`  | OR        |
| `100`  | XOR       |
| `101`  | NOT       |

For unused operation codes `110` and `111`, the output is set to `0000`.
---

## RTL Interface

| Signal | Width | Direction | Description      |
|--------|-------|-----------|------------------|
| `a`    | 4-bit | Input     | Operand A        |
| `b`    | 4-bit | Input     | Operand B        |
|`option`| 3-bit | Input     |Operation selector|
| `ans`  | 4-bit | Output    | ALU result       |
---

## RTL Architecture
The ALU is implemented as a combinational circuit using a Verilog `always @(*)` block and a `case` statement.

        a[3:0] ─────────┐
                        │
        b[3:0] ─────────┤
                        │
   option[2:0] ─────────┤
                        ▼
                   ┌─────────┐
                   │ 4-bit   │
                   │   ALU   │
                   └────┬────┘
                        │
                        ▼
                    ans[3:0]
                    
## Verification
A self-checking Verilog testbench was developed to exhaustively verify all supported ALU operations.
The testbench checks:
All 16 possible values of input A
All 16 possible values of input B
All 6 supported ALU operations
Total Test Cases
6 operations × 16 values of A × 16 values of B= 1536 test cases
![Verification Result](docs\verification_result.png)

## Simulation
The design was simulated using the XSim simulator in AMD Xilinx Vivado.
![Simulation Waveform](docs\waveform.png)

## Synthesis
The design was synthesized using AMD Xilinx Vivado 2023.2.
Target Device
FPGA Family : Kintex-7
Device      : xc7k70tfbv676-1

Resource Utilization
Resource	     Used
Slice LUTs	6
Slices	     2
LUT as Logic	6
Bonded IOB	15
![Synthesized Schematic](docs\schematic.png)

## Implementation
The synthesized design was successfully placed and routed using Vivado.
Post-Implementation Timing Summary
Metric	               Result
WNS	                    inf
TNS	                    0.000 ns
WHS	                    inf
THS	                    0.000 ns
Setup Failing Endpoints	0
Hold Failing Endpoints	0

The ALU is a purely combinational design and does not contain a clock or sequential elements. Therefore, conventional clock-based setup and hold timing metrics are not directly applicable to this design.

## Hardware Testing
Physical FPGA hardware testing was not performed because a physical FPGA development board was not available.

The design was successfully:
Simulated
Exhaustively verified
Synthesized
Placed and routed
Analyzed for resource utilization
Analyzed using Vivado timing reports

Bitstream generation was not completed because board-specific physical pin (LOC) and I/O standard (IOSTANDARD) constraints were not available.

## Tools Used
Verilog HDL
AMD Xilinx Vivado 2023.2
XSim Simulator
Kintex-7 FPGA target
RTL Simulation
Logic Synthesis
FPGA Implementation
Static Timing Analysis

## Project Structure
4-bit-ALU/
│
├── rtl/
│   └── alu.v
│
├── tb/
│   └── alutb.v
│
├── docs/
│   ├── verification_result.png
│   ├── schematic.png
│   ├── synthesis_utilization.png
│   └── implementation_timing.png
│   └── waveform.png
├── README.md
└── .gitignore

## Future Improvements
Add carry and borrow flags
Add zero and overflow flags
Parameterize the ALU width
Develop a clocked ALU wrapper
Add SystemVerilog assertions
Develop a more advanced verification environment
Validate the design on physical FPGA hardware