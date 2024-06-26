function [B,sigma,obslik]=MstepARHMM(data,gamma,predata,k,P,Q,T)

if 1
    
    % B
    B=zeros(Q,P);
    sigma=cell(Q,1);
    obslik=zeros(T,Q);
    %[a b]=max(gamma,[],2);
        
    for i=1:Q
        
        res1 = sum( reshape( bsxfun(@times, reshape(gamma(2:end,i) .* data(2:end,1),1,1,[]), reshape(predata(1:end-1,:)',1,P,[])) , P, [], 1)', 1);
        res2 = sum( bsxfun(@times, bsxfun(@times, reshape(predata(1:end-1,:)', P, 1, []),reshape(gamma(2:end,i), 1,1,[])), reshape(predata(1:end-1,:)', 1, P, [])) ,3);
        B(i,:)=-res1*pinv(res2);
        
        %         if 0
        %             x = filter(1,B(i,:),randn(5000,1));
        %             [arcoefs,E,K] = aryule(x,P);
        %             %pacf = -K;
        %             B(i,:) = arcoefs(2:end);
        %         end
        
        X = data(2:end,1)+predata(1:end-1,:)*B(i,:)';
        S = sum(gamma(2:end,i));
        
        % SIGMA
        if k>1, error('??'); end %zeros(k);
        
        sigma{i} = ((gamma(2:end,i).*X)' * X)/S;
        
        if(sigma{i}<=0)
            sigma{i} = 1e-32;
        end
        
        % Calcul of b
        obslik(:,i)=[mvnpdf(X(1),0,sigma{i}) ; mvnpdf(X,0,sigma{i})];
        
    end
    obslik = obslik+realmin;
    
else % methode Pablo old, longue
    
    predata2=predata;
    predata=cell(length(predata2),1);
    predata{1} = predata2(1,:)';
    for t=2:length(predata2)
        predata{t} = predata2(t-1,:)';
    end
    
    % B
    B=zeros(Q,P);
    for i=1:Q
        res1=zeros(1,P);
        res2=zeros(P,P);
        for t=1:T
            res1=res1+(gamma(t,i)*data(t,:)*predata{t}');
            res2=res2+(gamma(t,i)*predata{t}*predata{t}');
        end
        B(i,:)=-res1*pinv(res2);
    end
    
    % SIGMA
    sigma=cell(Q,1);
    for i=1:Q
        [sigmastep]=zeros(k);
        for t=1:T
            sigmastep=sigmastep+(gamma(t,i)*((data(t,:)+(B(i,:)*predata{t}))'*(data(t,:)+(B(i,:)*predata{t}))))/sum(gamma(:,i));
        end
        sigma{i}=sigmastep;
    end
    
    % Calcul of b
    obslik=zeros(T,Q);
    for i=1:Q
        for t=1:T
            obslik(t,i)=mvnpdf(data(t,:)+(B(i,:)*predata{t}),0,sigma{i});
        end
    end
    % A VOIR
    %obslik=mk_stochastic(obslik);
end
end
