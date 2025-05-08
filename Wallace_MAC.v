`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.04.2025 05:54:45
// Design Name: 
// Module Name: Wallace_MAC
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Wallace_MAC(
    input [31:0] ACC,
    input [15:0] A,B,
    output [32:0] out,
    input cin
    );
    // PP1 = 1st row of partial products(1st 16 PP)...
    wire [31:0] row1, row2;
    wire PP [15:0][15:0];
       
    // stage 1 wires
    wire S0,C0,S1,C1,S2,C2,S3,C3,S27,S28,S29,C27,C28,C29; // For Adders
    wire [2:1] S4,S5,S6,C4,C5,C6,S24,S25,S26,C24,C25,C26;
    wire [3:1] S7,S8,S9,C7,C8,C9,S21,S22,C21,C22,S23,C23;
    wire [4:1] S10,S11,S12,C10,C11,C12,S18,S19,S20,C18,C19,C20;
    wire [5:1] S13,S14,S15,S16,S17,C13,C14,C15,C16,C17;
    
    // stage 2 wires
    wire sum1,carry1,sum2,carry2,sum3,carry3,sum4,carry4,sum5,carry5,sum7,carry7,sum25,sum26,sum27,sum28,sum30,carry25,carry26,carry27,carry28,carry30;
    wire [2:1] sum6 ,sum8,sum9,sum10,sum20,sum22,sum23,sum24,carry6, carry8, carry9, carry10, carry20, carry22, carry23, carry24;
    wire [3:1] sum11,sum12,sum13,sum14,sum16,sum17,sum18,sum19,sum21,carry11, carry12, carry13, carry14, carry16, carry17, carry18, carry19, carry21;
    wire [4:1] sum15,carry15;
    
    // Generating  Partial Products
    genvar i,j;
    generate
        for(i=0;i<16;i=i+1) begin
            for(j=0;j<16;j=j+1) begin
            and a(PP[i][j],A[j],B[i]);    // when back extraction come in picture we add delay in here, 
//            and a1(PP1[i],A[i],B[1]);    // as all AND will have same load
//            and a2(PP2[i],A[i],B[2]);
//            and a3(PP3[i],A[i],B[3]);
//            and a4(PP4[i],A[i],B[4]);    // when back extraction come in picture we add delay in here, 
//            and a5(PP5[i],A[i],B[5]);    // as all AND will have same load
//            and a6(PP6[i],A[i],B[6]);
//            and a7(PP7[i],A[i],B[7]);
//            and a8(PP8[i],A[i],B[8]);    // when back extraction come in picture we add delay in here, 
//            and a9(PP9[i],A[i],B[9]);    // as all AND will have same load
//            and a10(PP10[i],A[i],B[10]);
//            and a11(PP11[i],A[i],B[11]);
//            and a12(PP12[i],A[i],B[12]);    // when back extraction come in picture we add delay in here, 
//            and a13(PP13[i],A[i],B[13]);    // as all AND will have same load
//            and a14(PP14[i],A[i],B[14]);
//            and a15(PP15[i],A[i],B[15]);
            end
        end
    endgenerate
    
    
    // FIRST STAGE WIRES 17
    HA h1( S0, C0, ACC[0],PP[0][0]);
    
    
//    generate 
//        for (i=1;i<16;i=i+1) begin
//            FA F1(S,C, ACC[i],PP[0][i],PP[1][i-1]);
//        end
//    endgenerate
    
//    generate 
//        for (i=2;i<14;i=i+1) begin
//            FA F2(S,C, PP[2][i],PP[3][i-1],PP[4][i-2]);
//        end
//    endgenerate
    
//    generate 
//        for (i=2;i<11;i=i+1) begin
//            FA F3(S,C, PP[5][i],PP[6][i-1],PP[7][i-2]);
//        end
//    endgenerate
    
//    generate 
//        for (i=2;i<8;i=i+1) begin
//            FA F4(S,C, PP[8][i],PP[9][i-1],PP[10][i-2]);
//        end
//    endgenerate
    
//    generate 
//        for (i=2;i<5;i=i+1) begin
//            FA F5(S,C, PP[11][i],PP[12][i-1],PP[13][i-2]);
//        end
//    endgenerate
    
//    generate
//        for(i=16;i<30;i=i+1) begin
//            FA F6(S,C, ACC[i], PP[i-15][15], PP[i-14][14]);
//        end
//    endgenerate
    
//    generate
//        for(i=16;i<27;i=i+1) begin
//            FA F7(S,C, PP[i-13][13], PP[i-12][12], PP[i-11][11]);
//        end
//    endgenerate
    
//    generate
//        for(i=16;i<24;i=i+1) begin
//            FA F8(S,C, PP[i-10][10], PP[i-9][9], PP[i-8][8]);
//        end
//    endgenerate
    
//    generate
//        for(i=16;i<21;i=i+1) begin
//            FA F9(S,C, PP[i-7][7], PP[i-6][6], PP[i-5][5]);
//        end
//    endgenerate
    
//    generate
//        for(i=16;i<18;i=i+1) begin
//            FA F10(S,C, PP[i-4][4], PP[i-3][3], PP[i-2][2]);
//        end
//    endgenerate
    
    // F1: i = 1 to 15
    FA F1_1(S1, C1, ACC[1], PP[0][1], PP[1][0]);
    FA F1_2(S2, C2, ACC[2], PP[0][2], PP[1][1]);
    FA F1_3(S3, C3, ACC[3], PP[0][3], PP[1][2]);
    FA F1_4(S4[1], C4[1], ACC[4], PP[0][4], PP[1][3]);
    FA F1_5(S5[1], C5[1], ACC[5], PP[0][5], PP[1][4]);
    
    FA F1_6(S6[1], C6[1], ACC[6], PP[0][6], PP[1][5]);
    
    FA F1_7(S7[1], C7[1], ACC[7], PP[0][7], PP[1][6]);
    
    FA F1_8(S8[1], C8[1], ACC[8], PP[0][8], PP[1][7]);
    
    FA F1_9(S9[1], C9[1], ACC[9], PP[0][9], PP[1][8]);
    
    FA F1_10(S10[1], C10[1], ACC[10], PP[0][10], PP[1][9]);
    
    FA F1_11(S11[1], C11[1], ACC[11], PP[0][11], PP[1][10]);
    
    FA F1_12(S12[1], C12[1], ACC[12], PP[0][12], PP[1][11]);
    
    FA F1_13(S13[1], C13[1], ACC[13], PP[0][13], PP[1][12]);
    
    FA F1_14(S14[1], C14[1], ACC[14], PP[0][14], PP[1][13]);
    
    FA F1_15(S15[1], C15[1], ACC[15], PP[0][15], PP[1][14]);
    
    // F2: i = 2 to 13
    FA F2_2(S4[2], C4[2], PP[2][2], PP[3][1], PP[4][0]);
    FA F2_3(S5[2], C5[2], PP[2][3], PP[3][2], PP[4][1]);
    
    FA F2_4(S6[2], C6[2], PP[2][4], PP[3][3], PP[4][2]);
    
    FA F2_5(S7[2], C7[2], PP[2][5], PP[3][4], PP[4][3]);
    
    FA F2_6(S8[2], C8[2], PP[2][6], PP[3][5], PP[4][4]);
    
    FA F2_7(S9[2], C9[2], PP[2][7], PP[3][6], PP[4][5]);
    
    FA F2_8(S10[2], C10[2], PP[2][8], PP[3][7], PP[4][6]);
    
    FA F2_9(S11[2], C11[2], PP[2][9], PP[3][8], PP[4][7]);
    
    FA F2_10(S12[2], C12[2], PP[2][10], PP[3][9], PP[4][8]);
    
    FA F2_11(S13[2], C13[2], PP[2][11], PP[3][10], PP[4][9]);
    
    FA F2_12(S14[2], C14[2], PP[2][12], PP[3][11], PP[4][10]);
    
    FA F2_13(S15[2], C15[2], PP[2][13], PP[3][12], PP[4][11]);
    
    // F3: i = 2 to 10
    FA F3_2(S7[3], C7[3], PP[5][2], PP[6][1], PP[7][0]);
    
    FA F3_3(S8[3], C8[3], PP[5][3], PP[6][2], PP[7][1]);
    
    FA F3_4(S9[3], C9[3], PP[5][4], PP[6][3], PP[7][2]);
    
    FA F3_5(S10[3], C10[3], PP[5][5], PP[6][4], PP[7][3]);
    
    FA F3_6(S11[3], C11[3], PP[5][6], PP[6][5], PP[7][4]);
    
    FA F3_7(S12[3], C12[3], PP[5][7], PP[6][6], PP[7][5]);
    
    FA F3_8(S13[3], C13[3], PP[5][8], PP[6][7], PP[7][6]);
    
    FA F3_9(S14[3], C14[3], PP[5][9], PP[6][8], PP[7][7]);
    
    FA F3_10(S15[3], C15[3], PP[5][10], PP[6][9], PP[7][8]);
    
    // F4: i = 2 to 7
    FA F4_2(S10[4], C10[4], PP[8][2], PP[9][1], PP[10][0]);
    
    FA F4_3(S11[4], C11[4], PP[8][3], PP[9][2], PP[10][1]);
    
    FA F4_4(S12[4], C12[4], PP[8][4], PP[9][3], PP[10][2]);
    
    FA F4_5(S13[4], C13[4], PP[8][5], PP[9][4], PP[10][3]);
    
    FA F4_6(S14[4], C14[4], PP[8][6], PP[9][5], PP[10][4]);
    
    FA F4_7(S15[4], C15[4], PP[8][7], PP[9][6], PP[10][5]);
    
    // F5: i = 2 to 4
    FA F5_2(S13[5], C13[5], PP[11][2], PP[12][1], PP[13][0]);
    
    FA F5_3(S14[5], C14[5], PP[11][3], PP[12][2], PP[13][1]);
    
    FA F5_4(S15[5], C15[5], PP[11][4], PP[12][3], PP[13][2]);
    
    // F6: i = 16 to 29
    FA F6_16(S16[1], C16[1], ACC[16], PP[1][15], PP[2][14]);
    FA F6_17(S17[1], C17[1], ACC[17], PP[2][15], PP[3][14]);
    FA F6_18(S18[1], C18[1], ACC[18], PP[3][15], PP[4][14]);
    FA F6_19(S19[1], C19[1], ACC[19], PP[4][15], PP[5][14]);
    FA F6_20(S20[1], C20[1], ACC[20], PP[5][15], PP[6][14]);
    FA F6_21(S21[1], C21[1], ACC[21], PP[6][15], PP[7][14]);
    FA F6_22(S22[1], C22[1], ACC[22], PP[7][15], PP[8][14]);
    FA F6_23(S23[1], C23[1], ACC[23], PP[8][15], PP[9][14]);
    FA F6_24(S24[1], C24[1], ACC[24], PP[9][15], PP[10][14]);
    FA F6_25(S25[1], C25[1], ACC[25], PP[10][15], PP[11][14]);
    FA F6_26(S26[1], C26[1], ACC[26], PP[11][15], PP[12][14]);
    FA F6_27(S27, C27, ACC[27], PP[12][15], PP[13][14]);
    FA F6_28(S28, C28, ACC[28], PP[13][15], PP[14][14]);
    FA F6_29(S29, C29, ACC[29], PP[14][15], PP[15][14]);
    
    // F7: i = 16 to 26
    FA F7_16(S16[2], C16[2], PP[3][13], PP[4][12], PP[5][11]);
    FA F7_17(S17[2], C17[2], PP[4][13], PP[5][12], PP[6][11]);
    FA F7_18(S18[2], C18[2], PP[5][13], PP[6][12], PP[7][11]);
    FA F7_19(S19[2], C19[2], PP[6][13], PP[7][12], PP[8][11]);
    FA F7_20(S20[2], C20[2], PP[7][13], PP[8][12], PP[9][11]);
    FA F7_21(S21[2], C21[2], PP[8][13], PP[9][12], PP[10][11]);
    FA F7_22(S22[2], C22[2], PP[9][13], PP[10][12], PP[11][11]);
    FA F7_23(S23[2], C23[2], PP[10][13], PP[11][12], PP[12][11]);
    FA F7_24(S24[2], C24[2], PP[11][13], PP[12][12], PP[13][11]);
    FA F7_25(S25[2], C25[2], PP[12][13], PP[13][12], PP[14][11]);
    FA F7_26(S26[2], C26[2], PP[13][13], PP[14][12], PP[15][11]);
    
    // F8: i = 16 to 23
    FA F8_16(S16[3], C16[3], PP[6][10], PP[7][9], PP[8][8]);
    FA F8_17(S17[3], C17[3], PP[7][10], PP[8][9], PP[9][8]);
    FA F8_18(S18[3], C18[3], PP[8][10], PP[9][9], PP[10][8]);
    FA F8_19(S19[3], C19[3], PP[9][10], PP[10][9], PP[11][8]);
    FA F8_20(S20[3], C20[3], PP[10][10], PP[11][9], PP[12][8]);
    FA F8_21(S21[3], C21[3], PP[11][10], PP[12][9], PP[13][8]);
    FA F8_22(S22[3], C22[3], PP[12][10], PP[13][9], PP[14][8]);
    FA F8_23(S23[3], C23[3], PP[13][10], PP[14][9], PP[15][8]);
    
    // F9: i = 16 to 20
    FA F9_16(S16[4], C16[4], PP[9][7], PP[10][6], PP[11][5]);
    FA F9_17(S17[4], C17[4], PP[10][7], PP[11][6], PP[12][5]);
    FA F9_18(S18[4], C18[4], PP[11][7], PP[12][6], PP[13][5]);
    FA F9_19(S19[4], C19[4], PP[12][7], PP[13][6], PP[14][5]);
    FA F9_20(S20[4], C20[4], PP[13][7], PP[14][6], PP[15][5]);
    
    // F10: i = 16 to 17
    FA F10_16(S16[5], C16[5], PP[12][4], PP[13][3], PP[14][2]);
    FA F10_17(S17[5], C17[5], PP[13][4], PP[14][3], PP[15][2]);
    
    // STAGE 2
    // -----------------------------------------------------------------------------------------------------------------
    // From bit 7-0
    HA Half1(sum1,carry1,S1,C0);
    FA f2(sum2,carry2,S2,C1,PP[2][0]);
    FA f3(sum3,carry3,S3,PP[2][1],PP[3][0]);
    FA f4(sum4,carry4,S4[1],S4[2],C3);
    FA f5(sum5,carry5,S5[1],S5[2],PP[5][0]);
    FA f6_1(sum6[1],carry6[1],S6[1],C5[1],C5[2]);
    FA f6_2(sum6[2],carry6[2],S6[2],PP[5][1],PP[6][0]);
    FA f7(sum7,carry7,S7[1],S7[2],S7[3]);
    
    // from bit 15-8
    FA f8_1(sum8[1],carry8[1],S8[1],S8[2],S8[3]);
    FA f8_2(sum8[2],carry8[2],C7[1],C7[2],PP[8][0]);
    FA f9_1(sum9[1],carry9[1],S9[1],S9[2],PP[8][1]);
    FA f9_2(sum9[2],carry9[2],S9[3],C8[1],PP[9][0]);
    

    FA f10_1(sum10[1], carry10[1], S10[1], S10[2], S10[3]);
    FA f10_2(sum10[2], carry10[2], S10[4], C9[1], C9[2]);
    
    FA f11_1(sum11[1], carry11[1], S11[1], S11[2], S11[3]);
    FA f11_2(sum11[2], carry11[2], S11[4], C10[1], C10[2]);
    FA f11_3(sum11[3], carry11[3], C10[3], C10[4], PP[11][0]);
    
    FA f12_1(sum12[1], carry12[1], S12[1], S12[2], S12[3]);
    FA f12_2(sum12[2], carry12[2], S12[4], PP[11][1], PP[12][0]);
    FA f12_3(sum12[3], carry12[3], C11[1], C11[2], C11[3]);
    
    FA f13_1(sum13[1], carry13[1], S13[1], S13[2], S13[3]);
    FA f13_2(sum13[2], carry13[2], S13[4], S13[5], C12[1]);
    FA f13_3(sum13[3], carry13[3], C12[2], C12[3], C12[4]);
    
    FA f14_1(sum14[1], carry14[1], S14[1], S14[2], S14[3]);
    FA f14_2(sum14[2], carry14[2], S14[4], S14[5], PP[14][0]);
    FA f14_3(sum14[3], carry14[3], C13[1], C13[2], C13[3]);
    
    FA f15_1(sum15[1], carry15[1], S15[1], S15[2], S15[3]);
    FA f15_2(sum15[2], carry15[2], S15[4], S15[5], PP[14][1]);
    FA f15_3(sum15[3], carry15[3], C14[1], C14[2], PP[15][0]);
    FA f15_4(sum15[4], carry15[4], C14[3], C14[4], C14[5]);
    
    FA f16_1(sum16[1], carry16[1], S16[1], S16[2], S16[3]);
    FA f16_2(sum16[2], carry16[2], S16[4], S16[5], PP[15][1]);
    FA f16_3(sum16[3], carry16[3], C15[1], C15[2], C15[3]);
    
    
    FA f17_1(sum17[1], carry17[1], S17[1], S17[2], S17[3]);
    FA f17_2(sum17[2], carry17[2], S17[4], S17[5], C16[1]);
    FA f17_3(sum17[3], carry17[3], C16[2], C16[3], C16[4]);
    
    FA f18_1(sum18[1], carry18[1], S18[1], S18[2], S18[3]);
    FA f18_2(sum18[2], carry18[2], S18[4], PP[14][4], PP[15][3]);
    FA f18_3(sum18[3], carry18[3], C17[1], C17[2], C17[3]);
    
    FA f19_1(sum19[1], carry19[1], S19[1], S19[2], S19[3]);
    FA f19_2(sum19[2], carry19[2], S19[4],C18[1], PP[15][4]);
    FA f19_3(sum19[3], carry19[3], C18[2], C18[3], C18[4]);
    
    FA f20_1(sum20[1], carry20[1], S20[1], S20[2], S20[3]);
    FA f20_2(sum20[2], carry20[2], S20[4], C19[1], C19[2]);
    
    FA f21_1(sum21[1], carry21[1], S21[1], S21[2], S21[3]);
    FA f21_2(sum21[2], carry21[2], C20[1], C20[2], C20[3]);
    FA f21_3(sum21[3], carry21[3], C20[4], PP[14][7], PP[15][6]);
    
    FA f22_1(sum22[1], carry22[1], S22[1], S22[2], S22[3]);
    FA f22_2(sum22[2], carry22[2], C21[1], C21[2], PP[15][7]);
    
    
    FA f23_1(sum23[1], carry23[1], S23[1], S23[2], S23[3]);
    FA f23_2(sum23[2], carry23[2], C22[1], C22[2], C22[3]);
    
    FA f24_1(sum24[1], carry24[1], S24[1], PP[14][10], PP[15][9]);
    FA f24_2(sum24[2], carry24[2], S24[2], C23[1], C23[2]);
    
    FA f25(sum25, carry25, S25[1], S25[2], PP[15][10]);
    
    FA f26(sum26, carry26, S26[1], S26[2], C25[1]);
    
    FA f27(sum27, carry27, S27, PP[14][13], PP[15][12]);
    
    FA f28(sum28, carry28, S28, C27, PP[15][13]);
    
    FA f30(sum30, carry30, ACC[30], C29, PP[15][15]);

    // Stage 3
    // ---------------------------------------------------------------------------------------------------------------------
    wire SUM2,CRRY2,SUM3,CRRY3,SUM5,CRRY5,SUM6,SUM7,SUM8,CRRY6,CRRY7,CRRY8;
    HA hlf2(SUM2,CRRY2,sum2,carry1);
    FA fa3(SUM3,CRRY3,sum3,carry2,C2);
    FA fa5(SUM5,CRRY5,sum5,C4[1],C4[2]);
    FA fa6(SUM6,CRRY6,sum6[1],sum6[2],carry5);
    FA fa7(SUM7,CRRY7,sum7,C6[1],C6[2]);
    FA fa8(SUM8,CRRY8,sum8[1],sum8[2],C7[3]);
    
    wire [2:1] SUM9,CRRY9;
    FA fa9_1(SUM9[1],CRRY9[1],sum9[1],sum9[2],C8[2]);
    FA fa9_2(SUM9[2],CRRY9[2],carry8[1],carry8[2],C8[3]);
    
    wire SUM10,CRRY10,SUM11,CRRY11;
    wire [2:1] SUM12,CRRY12,SUM13,CRRY13,SUM14,CRRY14;
    FA fa10(SUM10,CRRY10,sum10[1],sum10[2],C9[3]);  
    FA fa11(SUM11,CRRY11,sum11[1],sum11[2],sum11[3]);
    FA fa12_1(SUM12[1],CRRY12[1],sum12[1],sum12[2],sum12[3]);
    FA fa12_2(SUM12[2],CRRY12[2],carry11[1],carry11[2],C11[4]);
    
    FA fa13_1(SUM13[1],CRRY13[1],sum13[1],sum13[2],carry12[1]);
    FA fa13_2(SUM13[2],CRRY13[2],sum13[3],carry12[2],carry12[3]);
    
    FA fa14_1(SUM14[1],CRRY14[1],sum14[1],sum14[2],sum14[3]);
    FA fa14_2(SUM14[2],CRRY14[2],carry13[3],C13[4],C13[5]);
    
    wire [2:1] SUM15,SUM17,SUM18,SUM19,SUM20,CRRY15,CRRY17,CRRY18,CRRY19,CRRY20;
    wire [3:1] SUM16,CRRY16;
    FA fa15_1(SUM15[1],CRRY15[1],sum15[1],sum15[2],carry14[1]);
    FA fa15_2(SUM15[2],CRRY15[2],sum15[3],sum15[4],carry14[2]);
    
    FA fa16_1(SUM16[1],CRRY16[1],sum16[1],sum16[2],carry15[1]);
    FA fa16_2(SUM16[2],CRRY16[2],sum16[3],carry15[2],carry15[3]);
    FA fa16_3(SUM16[3],CRRY16[3],carry15[4],C15[4],C15[5]);
    
    FA fa17_1(SUM17[1],CRRY17[1],sum17[1],sum17[2],sum17[3]);
    FA fa17_2(SUM17[2],CRRY17[2],carry16[1],carry16[2],C16[5]);
    
    FA fa18_1(SUM18[1],CRRY18[1],sum18[1],sum18[2],sum18[3]);
    FA fa18_2(SUM18[2],CRRY18[2],carry17[1],C17[4],C17[5]);
    
    FA fa19_1(SUM19[1],CRRY19[1],sum19[1],sum19[2],carry18[1]);
    FA fa19_2(SUM19[2],CRRY19[2],sum19[3],carry18[2],carry18[3]);
    
    FA fa20_1(SUM20[1],CRRY20[1],sum20[1],sum20[2],carry19[1]);
    FA fa20_2(SUM20[2],CRRY20[2],carry19[2],C19[3],C19[4]);
    
    wire SUM21,SUM23,SUM24,SUM25,SUM26,SUM27,SUM29,CRRY21,CRRY23,CRRY24,CRRY25,CRRY26,CRRY27,CRRY29;
    wire [2:1] SUM22,CRRY22;
    
    FA fa21(SUM21,CRRY21,sum21[1],sum21[2],sum21[3]);
    
    FA fa22_1(SUM22[1],CRRY22[1],sum22[1],sum22[2],carry21[1]);
    FA fa22_2(SUM22[2],CRRY22[2],carry21[2],carry21[3],C21[3]);
    
    FA fa23(SUM23,CRRY23,sum23[1],sum23[2],carry22[1]);
    FA fa24(SUM24,CRRY24,sum24[1],sum24[2],C23[3]);
    FA fa25(SUM25,CRRY25,sum25,C24[1],C24[2]);
    FA fa26(SUM26,CRRY26,sum26,carry25,C25[2]);
    FA fa27(SUM27,CRRY27,sum27,C26[1],C26[2]);
    FA fa29(SUM29,CRRY29,carry28,S29,C28);
    
    // Stage 4
    // ----------------------------------------------------------------------------------
    
    wire SM3,SM4,SM7,SM8,SM9,SM10,SM11,SM12,SM13,CA3,CA4,CA7,CA8,CA9,CA10,CA11,CA12,CA13;
    wire [2:1] SM14,SM15,SM16,SM17,SM18,CA14,CA15,CA16,CA17,CA18;
    HA ha3(SM3,CA3,SUM3,CRRY2);
    FA full4(SM4,CA4,sum4,carry3,CRRY3);
    FA full7(SM7,CA7,SUM7,carry6[1],carry6[2]);
    FA full8(SM8,CA8,SUM8,CRRY7,carry7);
    FA full9(SM9,CA9,SUM9[1],SUM9[2],CRRY8);
    FA full10(SM10,CA10,SUM10,carry9[1],carry9[2]);
    FA full11(SM11,CA11,SUM11,carry10[1],carry10[2]);
    FA full12(SM12,CA12,SUM12[1],SUM12[2],carry11[3]);
    FA full13(SM13,CA13,SUM13[1],SUM13[2],CRRY12[1]);
    FA full14_1(SM14[1],CA14[1],SUM14[1],SUM14[2],CRRY13[1]);
    FA full14_2(SM14[2],CA14[2],CRRY13[2],carry13[1],carry13[2]);
    FA full15_1(SM15[1],CA15[1],SUM15[1],SUM15[2],carry14[3]);
    HA ha15_2(SM15[2],CA15[2],CRRY14[1],CRRY14[2]);
    FA full16_1(SM16[1],CA16[1],SUM16[1],SUM16[2],SUM16[3]);
    HA ha16_2(SM16[2],CA16[2],CRRY15[1],CRRY15[2]);
    FA full17_1(SM17[1],CA17[1],SUM17[1],SUM17[2],CRRY16[1]);
    FA full17_2(SM17[2],CA17[2],CRRY16[2],CRRY16[3],carry16[3]);
    FA full18_1(SM18[1],CA18[1],SUM18[1],SUM18[2],CRRY17[1]);
    FA full18_2(SM18[2],CA18[2],CRRY17[2],carry17[2],carry17[3]);
    
    wire SM19,SM20,SM21,SM22,SM23,SM24,SM25,SM27,SM28,CA19,CA20,CA21,CA22,CA23,CA24,CA25,CA27,CA28;
    FA full19(SM19,CA19,SUM19[1],SUM19[2],CRRY18[1]);
    FA full20(SM20,CA20,SUM20[1],SUM20[2],carry19[3]);
    FA full21(SM21,CA21,SUM21,carry20[1],carry20[2]);
    FA full22(SM22,CA22,SUM22[1],SUM22[2],CRRY21);
    FA full23(SM23,CA23,SUM23,CRRY22[1],carry22[2]);
    FA full24(SM24,CA24,SUM24,carry23[1],carry23[2]);
    FA full25(SM25,CA25,SUM25,carry24[1],carry24[2]);
    FA full27(SM27,CA27,SUM27,CRRY26,carry26);
    FA full28(SM28,CA28,CRRY27,sum28,carry27);
    
    
    // Stage 5
    // ---------------------------------------------------------------------------------------------------------
    
    wire SS4,SS5,SS10,SS11,SS12,SS13,SS14,SS15,SS16,SS17,SS18,SS19,SS20,SS21,SS23,SS24,SS25,SS26;
    wire CC4,CC5,CC10,CC11,CC12,CC13,CC14,CC15,CC16,CC17,CC18,CC19,CC20,CC21,CC23,CC24,CC25,CC26;
    
    HA hh4(SS4,CC4,SM4,CA3);
    FA ff5(SS5,CC5,SUM5,carry4,CA4);
    FA ff10(SS10,CC10,SM10,CRRY9[1],CRRY9[2]);
    FA ff11(SS11,CC11,SM11,CA10,CRRY10);
    FA ff12(SS12,CC12,SM12,CA11,CRRY11);
    FA ff13(SS13,CC13,SM13,CA12,CRRY12[2]);
    FA ff14(SS14,CC14,SM14[1],SM14[2],CA13);
    FA ff15(SS15,CC15,SM15[1],SM15[2],CA14[1]);
    FA ff16(SS16,CC16,SM16[1],SM16[2],CA15[1]);
    FA ff17(SS17,CC17,SM17[1],SM17[2],CA16[1]);
    FA ff18(SS18,CC18,SM18[1],SM18[2],CA17[1]);
    FA ff19(SS19,CC19,SM19,CA18[1],CRRY18[2]);
    FA ff20(SS20,CC20,SM20,CRRY19[1],CRRY19[2]);
    FA ff21(SS21,CC21,SM21,CRRY20[1],CRRY20[2]);
    FA ff23(SS23,CC23,SM23,CA22,CRRY22[2]);
    FA ff24(SS24,CC24,SM24,CA23,CRRY23);
    FA ff25(SS25,CC25,SM25,CA24,CRRY24);
    FA ff26(SS26,CC26,CA25,SUM26,CRRY25);
    
    
    // Stage 6
    // ---------------------------------------------------------------------------------------------
    
    wire SL5,SL6,SL7,SL8,SL9,SL10,SL11,SL12,SL13,SL14,SL15,SL16,SL17,SL18,SL19,SL20,SL21,SL22;
    wire CL5,CL6,CL7,CL8,CL9,CL10,CL11,CL12,CL13,CL14,CL15,CL16,CL17,CL18,CL19,CL20,CL21,CL22;
    
    HA hl5(SL5,CL5,SS5,CC4);
    FA fl6(SL6,CL6,CC5,SUM6,CRRY5);
    HA hl7(SL7,CL7,SM7,CRRY6);
    HA hl8(SL8,CL8,SM8,CA7);
    HA hl9(SL9,CL9,SM9,CA8);
    HA hl10(SL10,CL10,SS10,CA9);
    HA hl11(SL11,CL11,SS11,CC10);
    HA hl12(SL12,CL12,SS12,CC11);
    HA hl13(SL13,CL13,SS13,CC12);
    HA hl14(SL14,CL14,SS14,CC13);
    FA fl15(SL15,CL15,SS15,CC14,CA14[2]);
    FA fl16(SL16,CL16,SS16,CC15,CA15[2]);
    FA fl17(SL17,CL17,SS17,CC16,CA16[2]);
    FA fl18(SL18,CL18,SS18,CC17,CA17[2]);
    FA fl19(SL19,CL19,SS19,CC18,CA18[2]);
    FA fl20(SL20,CL20,SS20,CC19,CA19);
    FA fl21(SL21,CL21,SS21,CC20,CA20);
    FA fl22(SL22,CL22,CC21,SM22,CA21);
    
     
    assign row1 [31:0] = {ACC[31],CRRY29,SUM29,SM28,CC26,SS26,SS25,SS24,SS23,SL22,SL21,SL20,SL19,SL18,SL17,SL16,SL15,SL14,SL13,SL12,SL11,SL10,SL9,SL8,SL7,SL6,SL5,SS4,SM3,SUM2,sum1,S0};
    assign row2 [31:0] = {carry30,sum30,CA28,CA27,SM27,CC25,CC24,CC23,CL22,CL21,CL20,CL19,CL18,CL17,CL16,CL15,CL14,CL13,CL12,CL11,CL10,CL9,CL8,CL7,CL6,CL5,6'b000000};
    
    
    Brent_Kung b1(.a(row1),.b(row2),.cin(cin),.sum(out));
    
endmodule














