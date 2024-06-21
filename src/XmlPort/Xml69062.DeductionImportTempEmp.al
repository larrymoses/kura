#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
XmlPort 69062 "Deduction Import Temp Emp"
{
    Format = VariableText;
    FormatEvaluate = Legacy;

    schema
    {
        textelement(Root)
        {
            tableelement("Assignment Matrix-X Temp-E";"Assignment Matrix-X Temp-E")
            {
                AutoReplace = true;
                XmlName = 'AssgnMat';
                SourceTableView = where(Type=const(Deduction));
                fieldelement(EmplNo;"Assignment Matrix-X Temp-E"."Employee No")
                {
                }
                fieldelement(PayPeriod;"Assignment Matrix-X Temp-E"."Payroll Period")
                {
                }
                fieldelement(Code;"Assignment Matrix-X Temp-E".Code)
                {
                }
                fieldelement(amt;"Assignment Matrix-X Temp-E".Amount)
                {
                }
                fieldelement(PostingGroup;"Assignment Matrix-X Temp-E"."Posting Group Filter")
                {
                }

                trigger OnAfterInsertRecord()
                begin
                    
                    Emp.Get("Assignment Matrix-X Temp-E"."Employee No");
                    if Emp.Status=Emp.Status::Terminated then
                    currXMLport.Skip;
                    
                    
                    /*
                    HRSetup.GET;
                    //HRSetup.TESTFIELD(HRSetup."Overtime @1.5 Code");
                    //HRSetup.TESTFIELD(HRSetup."Overtime @2.0 Code");
                    HRSetup.TESTFIELD(HRSetup."Absence Code");
                    HRSetup.TESTFIELD(HRSetup."Basic Salary Code");
                    
                    
                    IF AssignMatrix.GET("Assignment Matrix-X Temp-E"."Employee No","Assignment Matrix-X Temp-E".Type::Payment,HRSetup."Basic Salary Code",
                    "Assignment Matrix-X Temp-E"."Payroll Period") THEN BEGIN
                    
                    
                    //AssignMatrix2.INIT;
                     "Assignment Matrix-X Temp-E".VALIDATE("Assignment Matrix-X Temp-E"."Employee No");
                    "Assignment Matrix-X Temp-E".Type:="Assignment Matrix-X Temp-E".Type::Payment;
                    "Assignment Matrix-X Temp-E".Code:=HRSetup."Absence Code";
                    "Assignment Matrix-X Temp-E".VALIDATE(Code);
                    
                    "Assignment Matrix-X Temp-E".Amount:=-ROUND(("Assignment Matrix-X Temp-E"."No. Of Hours"/225*AssignMatrix.Amount),1);
                    "Assignment Matrix-X Temp-E".VALIDATE(Amount);
                    "Assignment Matrix-X Temp-E".INSERT;
                    
                    END;
                    */
                    
                     "Assignment Matrix-X Temp-E".Validate("Assignment Matrix-X Temp-E"."Employee No");
                     "Assignment Matrix-X Temp-E".Validate("Assignment Matrix-X Temp-E"."Payroll Period");
                    "Assignment Matrix-X Temp-E".Type:="Assignment Matrix-X Temp-E".Type::Payment;
                    //"Assignment Matrix-X Temp-E Temp-E Temp-E".Code:="Assignment Matrix-X Temp-E Temp-E Temp-E".Code;
                     //message('%1',);
                    "Assignment Matrix-X Temp-E".Validate("Assignment Matrix-X Temp-E".Code);
                    "Assignment Matrix-X Temp-E".Amount:=amt;
                    "Assignment Matrix-X Temp-E".Validate("Assignment Matrix-X Temp-E".Amount);
                    
                    /*
                    IF AssignMatrix.GET("Assignment Matrix-X Temp-E"."Employee No","Assignment Matrix-X Temp-E".Type::Payment
                    ,"Assignment Matrix-X Temp-E".Code,"Assignment Matrix-X Temp-E"."Payroll Period")=TRUE THEN BEGIN
                    MESSAGE('%1',"Assignment Matrix-X Temp-E".Amount);
                    
                    //IF "Assignment Matrix-X Temp-E Temp-E Temp-E".Amount=0 THEN
                    //"Assignment Matrix-X Temp-E Temp-E Temp-E".DELETE ELSE
                    
                    "Assignment Matrix-X Temp-E".MODIFY;
                    END ELSE BEGIN
                     "Assignment Matrix-X Temp-E".INSERT;
                    
                    END;
                    */
                    // "Assignment Matrix-X Temp-E Temp-E Temp-E".INSERT;

                end;
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    trigger OnPostXmlPort()
    begin
        Message('Success');
    end;

    var
        AssignMatrix: Record "Assignment Matrix-X Temp-E";
        AssignMatrix2: Record "Assignment Matrix-X Temp-E";
        HRSetup: Record "Human Resources Setup";
        amt: Decimal;
        Emp: Record "Temporary Employee";
}

