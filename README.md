# 8-bit ALU Using Custom 4-bit Soft IP Core

## Overview

This project demonstrates the reuse of a previously designed **4-bit Verilog ALU** as a custom **Vivado Soft IP Core** to build an **8-bit arithmetic calculator**.

Instead of redesigning the complete ALU, the existing 4-bit ALU was packaged as a reusable IP and integrated twice in a new Vivado project. The resulting system accepts two 8-bit binary inputs and performs addition, subtraction, multiplication, or division based on the selected operation.

The design was implemented and tested on a **Digilent Nexys A7 (Artix-7 FPGA)**.

> **Note:** The original 4-bit ALU design is documented separately in my [4-bit ALU repository](reshmithaa23/4-bit-ALU-Calculator).

---

## Project Highlights

* Reused a previously designed **4-bit Verilog ALU**
* Packaged the ALU as a **custom Vivado Soft IP Core**
* Integrated **two instances** of the 4-bit IP to construct an 8-bit arithmetic system
* Designed the 8-bit interface and integration logic
* Used **Vivado IP Integrator / Block Design**
* Applied FPGA pin and timing constraints using **XDC**
* Synthesized and implemented the design in Vivado
* Validated the final design on a **Digilent Nexys A7 FPGA**

---

## System Architecture

The basic architecture is:

```text
                 8-bit Input A
                      │
                      ├──────────────┐
                      │              │
                  Lower 4 bits   Upper 4 bits
                      │              │
                      ▼              ▼
                 ┌─────────┐    ┌─────────┐
                 │  4-bit  │    │  4-bit  │
                 │  ALU IP │    │  ALU IP │
                 │   #1    │    │   #2    │
                 └────┬────┘    └────┬────┘
                      │              │
                      └──────┬───────┘
                             │
                       8-bit Result
                             │
                             ▼
                    7-Segment Display
```

The operation is selected using the onboard push buttons:

| Button | Operation      |
| ------ | -------------- |
| BTNC   | Addition       |
| BTNU   | Subtraction    |
| BTND   | Multiplication |
| BTNL   | Division       |

The result is displayed in **hexadecimal** on the onboard 7-segment display.

---

## Soft IP Integration

The previously developed 4-bit ALU was packaged as a custom Vivado Soft IP Core.

The packaged IP was then added to a new Vivado project and instantiated twice to construct the 8-bit arithmetic system.

<img width="1170" height="758" alt="ip_packaging" src="https://github.com/user-attachments/assets/d6134bb7-25cb-4acd-ae54-210bdb3a8000" />


---

## Vivado Block Design

The two 4-bit ALU IP instances were integrated using **Vivado IP Integrator** to form the larger 8-bit system.

<img width="1408" height="652" alt="Block_Diagram" src="https://github.com/user-attachments/assets/bfdbb621-4cdc-4220-8f83-86bfc14ef487" />


This approach demonstrates **hardware IP reuse and modular digital design**, where an existing hardware block can be reused as a building block in a larger system.

---

## FPGA Implementation

The completed design was synthesized and implemented using **AMD Vivado 2025.2** and targeted to the **Digilent Nexys A7 / Artix-7 FPGA**.

<img width="1030" height="263" alt="Implmented_Timing_Summary" src="https://github.com/user-attachments/assets/05f677eb-813c-47a5-8f3b-f101fedba6e4" />


The implemented design satisfied the specified timing constraints.

---

## Hardware Demonstration

The design was tested on the Nexys A7 FPGA using onboard switches and push buttons.

For example:

**Input A = 25 decimal = 19 hex**
**Input B = 10 decimal = 0A hex**

| Operation | Result                   |
| --------- | ------------------------ |
| 25 + 10   | 35 decimal = `23` hex    |
| 25 − 10   | 15 decimal = `0F` hex    |
| 25 × 10   | 250 decimal = `FA` hex   |
| 25 ÷ 10   | 2 remainder 5 = `02` hex |

**Sum:**
<img width="999" height="680" alt="Sum" src="https://github.com/user-attachments/assets/278d23e2-792d-4847-8a9f-e7fbfc40b465" />

**Difference:**
<img width="1016" height="676" alt="Difference" src="https://github.com/user-attachments/assets/c60e6a81-7597-44ea-8932-1f11661bbc6d" />

**Product:**
<img width="1006" height="678" alt="Product" src="https://github.com/user-attachments/assets/9173d9ef-b14a-4444-ab0c-07183dd2d6dc" />

**Quotient and Remainder:**
<img width="1008" height="668" alt="Quotient and Remainder" src="https://github.com/user-attachments/assets/c3bf9ef9-4c53-45e7-b501-69f5b26ed8a7" />

---

## Tools & Technologies

* **Verilog HDL**
* **AMD Vivado 2025.2**
* **Vivado IP Integrator**
* **Vivado Soft IP Packaging**
* **XDC Constraints**
* **Digilent Nexys A7**
* **Artix-7 FPGA**

---

## What I Learned

This project provided hands-on experience with:

* Custom FPGA IP creation and packaging
* Reusable RTL hardware design
* IP-based system integration
* Hierarchical and modular digital design
* Vivado IP Integrator
* FPGA synthesis and implementation
* Hardware validation using a development board

The project extends the original 4-bit ALU by demonstrating how a previously designed hardware module can be converted into a reusable IP and integrated into a larger FPGA-based system.

---

## Related Project

The original 4-bit ALU/Arithmetic Calculator used as the Soft IP in this project is documented separately:

**[reshmithaa23/4-bit-ALU-Calculator](reshmithaa23/4-bit-ALU-Calculator)**


---

## Author

**Reshmithaa A**
B.Tech Electronics and Communication Engineering

#FPGA #VLSI #Verilog #Vivado #SoftIP #IPCore #DigitalDesign
