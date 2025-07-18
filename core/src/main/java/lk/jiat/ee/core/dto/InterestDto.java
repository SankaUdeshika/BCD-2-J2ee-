package lk.jiat.ee.core.dto;

import java.io.Serializable;

public class InterestDto implements Serializable {
    public  double interestRate = 0.005; //5%

    public double getIntrestRate(){
        return interestRate;
    }

}
