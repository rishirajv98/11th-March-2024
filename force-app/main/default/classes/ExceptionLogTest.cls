@isTest
public class ExceptionLogTest {

    @isTest public static void method1Test(){
        
        Test.startTest();
        
        List<Integer> intList = new List<Integer>{4,6};
        ExceptionLog.method1(intList);
        
        Test.stopTest();
        
        System.assertEquals(10, intList[0]+intList[1]);
    }
}