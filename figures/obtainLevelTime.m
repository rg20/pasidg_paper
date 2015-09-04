levelTime = [0 0 0 0];

for i=1:4
    levelTime(i) = levelTime(i) + global_rhs*kids(i)/K;
    levelTime(i) = levelTime(i) + local_update(i);

    for j=1:i
        levelTime(i) = levelTime(i) + local_rhs(i)*kids(i)/ks(j);
    end

    if(i+1 <= 4)
        levelTime(i) = levelTime(i) + local_gauss_update(i+1);
    end
end