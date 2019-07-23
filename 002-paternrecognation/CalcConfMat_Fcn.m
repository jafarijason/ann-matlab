function ConfMat = CalcConfMat_Fcn(ClassReal , ClassNet,ClassNum)
    ConfMat = zeros(ClassNum);
    
    for  ii = 1:numel(ClassReal)
        ConfMat(ClassNet(ii),ClassNet(ii)) = ConfMat(ClassNet(ii),ClassNet(ii))+1;
    end
    
end
