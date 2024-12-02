# Opcode Table for ALU Operations

| Opcode (4 bits) | Operation Group      | Specific Operation       | Description                                |
|-----------------|----------------------|--------------------------|--------------------------------------------|
| 0000            | Arithmetic           | Addition                 | `Y = A + B + carry_in`                     |
| 0001            | Arithmetic           | Subtraction              | `Y = A - B`                                |
| 0100            | Multiplication       | Product Low              | `Y = product_low` (Lower 4 bits of product)|
| 1000            | Division             | Quotient                 | `Y = quotient_out`                         |
| 1001            | Division             | Remainder                | `remainder = remainder_out`                |
| Default         | Undefined Operation  | No Operation             | `Y = 4'b0000` 