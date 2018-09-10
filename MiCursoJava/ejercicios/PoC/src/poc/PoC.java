/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package poc;

/**
 *
 * @author 180910_GPO_SALINAS
 */
public class PoC {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        /*int i=10;
        int j=i/0;
        System.out.println(j);*/
        
        
        double a=10.0;
        double b=a/0;
        System.out.println("b=" + b);
        
        int i=-3;
        //System.out.println("i= " + (- ++i));
        
        System.out.println("i= " + (+ - + ++i));
    }
    
}
