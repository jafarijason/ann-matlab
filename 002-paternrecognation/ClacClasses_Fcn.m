function  Classes =  ClacClasses_Fcn(NetOut  )
    Classes = zeros(size(NetOut,1),1 );
    
    for ii=1:numel(Classes)
      NO =    NetOut(ii,:);
      I = find(NO==max(NO));
      Classes(ii) = I;
    end

end