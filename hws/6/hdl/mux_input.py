# shift_right_arithmetic

from textwrap import fill

N = 32

inputs = ", ".join([f"in[{abs(i)}]" for i in range(32)])
inputs = inputs.split(", ")
inputs.append('in[31]')

for i in range(N):
    print(f"mux_32 OUT_{i} (")
    inputs_tmp = inputs

    for j in range(N):
        if i == 0:
            break
        elif j >= (N-i):
            inputs_tmp[j] = "in[31]"
        else:
            inputs_tmp[j] = inputs[j+1]
    
    mux_inputs = [f".in{i:02d}({inputs_tmp[i]})" for i in range(32)]
    mux_inputs.append(".switch(shamt)")
    mux_inputs.append(f".out({i})")
    res = ", ".join(mux_inputs)
    print(fill(res, width=80))
    print(");")
    print("\n")

# # shift_right_logical

# from textwrap import fill

# N = 32

# inputs = ", ".join([f"in[{abs(i)}]" for i in range(32)])
# inputs = inputs.split(", ")
# inputs.append('in[31]')

# for i in range(N):
#     print(f"mux_32 OUT_{i} (")
#     inputs_tmp = inputs

#     for j in range(N):
#         if i == 0:
#             break
#         elif j >= (N-i):
#             inputs_tmp[j] = 0
#         else:
#             inputs_tmp[j] = inputs[j+1]
    
#     mux_inputs = [f".in{i:02d}({inputs_tmp[i]})" for i in range(32)]
#     mux_inputs.append(".switch(shamt)")
#     mux_inputs.append(f".out({i})")
#     res = ", ".join(mux_inputs)
#     print(fill(res, width=80))
#     print(");")
#     print("\n")


# # shift_left_logical

# from textwrap import fill

# N = 32

# inputs = ", ".join([f"in[{abs(N-1-i)}]" for i in range(32)])
# inputs = inputs.split(", ")


# print(f"mux_32 OUT_{N-1} (")
# mux_inputs = [f".in{i:02d}({inputs[i]})" for i in range(32)]
# mux_inputs.append(".switch(shamt)")
# mux_inputs.append(f".out({N-1})")
# res = ", ".join(mux_inputs)
# print(fill(res, width=80))
# print(");")
# print("\n")

# for i in range(N):
#     print(f"mux_32 OUT_{N-2-i} (")
#     inputs_tmp = inputs

#     for j in range(N):
#         if j >= (31-i):
#             inputs_tmp[j] = 0
#         else:
#             inputs_tmp[j] = inputs[j+1]
    
#     mux_inputs = [f".in{i:02d}({inputs_tmp[i]})" for i in range(32)]
#     mux_inputs.append(".switch(shamt)")
#     mux_inputs.append(f".out({N-2-i})")
#     res = ", ".join(mux_inputs)
#     print(fill(res, width=80))
#     print(");")
#     print("\n")

