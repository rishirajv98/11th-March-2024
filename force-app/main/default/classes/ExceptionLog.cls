public class ExceptionLog {

    public static void method1(List<Integer> intList){
        
        Integer getInt = returnValue(intList[0], intList[1]);
        System.debug('value of integer : ' + getInt);
    }
    
    public static Integer returnValue(Integer a1, Integer a2){
        
        Integer addition = a1 + a2;
        return addition;
    }
}