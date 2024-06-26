function [signal, signalbruite]=autoregres(data,predata,B,Sigma)
%AUTOREGRESSIVE TEST
Q=length(Sigma);
signal=cell(Q,1);
signalbruite=signal;
w=cell(Q,1);
T=length(predata);
for i=1:Q
    signalstep=zeros(T,1);
    signalstep(2:end) = -predata(1:end-1,:)*B(i,:)';
    signalstep(1) = signalstep(2);
    
    %     for t=2:T
    %         signalstep(t)=-(B(i,:)*predata(t-1,:)');
    %     end
    %    signalstep(1)=signalstep(2);
    
    w{i}=mvnrnd(0,Sigma{i},T);
    signal{i}=signalstep;
    signalbruite{i}=signal{i}+w{i};
end
end