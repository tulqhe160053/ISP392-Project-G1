/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Validate;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author ducth
 */
public class Validate {
     private static Pattern pattern;
    private Matcher matcher;

    private static final String EMAIL_REGEX = "^[A-Za-z0-9]+[A-Za-z0-9]*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)$";

    public Validate() {
        pattern = Pattern.compile(EMAIL_REGEX);
    }

    public boolean validateEmail(String regex) {
        matcher = pattern.matcher(regex);
        return matcher.matches();
    }

    public boolean checkPhone(String str) {
        String reg = "^(0|\\+84)(\\s|\\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\\d)(\\s|\\.)?(\\d{3})(\\s|\\.)?(\\d{3})$";
        boolean kt = str.matches(reg);
        return kt;
    }
    
    public boolean checkPassword(String regex){
        String reg = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{6,}$";
        boolean kt = regex.matches(reg);
        return kt;
    }
}
