function [SEtst, CEtst] = MLPtest(Xtst, Ttst, w, w0, v, v0)  N=size(Xtst,1); %데이터의 수  for i=1:N %각 데이터에 대한 인식 시작    x=Xtst(i,:); t=Ttst(i,:); %입/출력 데이터 설정     uh=x*w+w0; %은닉 뉴런의 가중합 계산     z=tanh(uh); %은닉 뉴런의 출력 계산     uo=z*v+v0; %출력 뉴런의 가중합 계산    y=tanh(uo); %출력 뉴런의 출력 계산     e=y-t; %목표 출력과의 차 계산     E(i,1)=e*e'; %제곱오차 계산    [a, index] = max(y);    if index==1 Ytst(i,:) = [1 0 0];    elseif index==2 Ytst(i,:) = [0 1 0];    elseif index==3 Ytst(i,:) = [0 0 1];     end  end    SEtst=sum(E.^2)/N; %평균제곱오차 계산   diffTY = sum(abs(Ttst-Ytst))/3;   %diffTY = sum(abs(Ttst-Ytst'))/2;  % 잘못 분류된 경우를 카운트  CEtst=diffTY(1)/N; %분류오차 계산