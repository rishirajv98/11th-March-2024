@isTest
public class HandleCustomExceptionTest {

    @isTest
    static void customExceptionMethod(){
        
        Test.startTest();
        
        try{
            
            Account customException = new Account();
            insert customException;
        }catch(Exception e){
            
            HandleCustomException.LogException(e);
            
            System.debug(e.getMessage());
            System.debug(e.getTypeName());
            System.debug(e.getStackTraceString());
            
            System.assertEquals('System.DmlException', e.getTypeName(), 'This is Dml Exception.');
        }
                        
        Test.stopTest();                
    }
}