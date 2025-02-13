clc
clear all
close all

N = 5;
n = 0:4*N-1;
xm = mod(n,N);
stem(n,xm);