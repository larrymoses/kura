#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
XmlPort 69055 "Ded Import"
{
    DefaultFieldsValidation = false;
    Direction = Both;
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Fixed Asset";"Fixed Asset")
            {
                AutoReplace = false;
                AutoSave = true;
                AutoUpdate = true;
                XmlName = 'AssignMat';
                fieldelement(EmpNo;"Fixed Asset"."No.")
                {
                }
                fieldelement(DedCode;"Fixed Asset"."Record Type")
                {
                }
                fieldelement(PayPeriod;"Fixed Asset".Description)
                {
                }
                fieldelement(PostingGroup;"Fixed Asset"."Search Description")
                {
                }
                fieldelement(amt;"Fixed Asset"."Description 2")
                {
                }
                fieldelement(closingbal;"Fixed Asset"."Master Road Link ID")
                {
                }
                fieldelement(ClosingBal;"Fixed Asset"."Original Road ID")
                {
                }
                fieldelement(wwww;"Fixed Asset"."Original Road Class")
                {
                }
                fieldelement(eeeee;"Fixed Asset"."Original Road No")
                {
                }
                fieldelement(errrrr;"Fixed Asset"."Orignal Road Agency")
                {
                }
                fieldelement(ttttt;"Fixed Asset"."Road Label")
                {
                }
                fieldelement(nnnnn;"Fixed Asset"."Gazetted  Road Class")
                {
                }
                fieldelement(mn;"Fixed Asset".Government)
                {
                }
                fieldelement(fff;"Fixed Asset"."Constituency ID")
                {
                }
                fieldelement(ert;"Fixed Asset"."County ID")
                {
                }
                fieldelement(eerq;"Fixed Asset"."Region ID")
                {
                }
                fieldelement(iuy;"Fixed Asset"."Total Road Length(KM)")
                {
                }
                fieldelement(red;"Fixed Asset"."Total Paved Length(KM)")
                {
                }

                trigger OnAfterInsertRecord()
                begin
                    
                    // /
                    //"Assignment Matrix-X".MODIFY;
                    
                    /*
                    
                    "Assignment Matrix-X"."Employee No":="Assignment Matrix-X"."Employee No";
                    "Assignment Matrix-X".VALIDATE("Employee No");
                    "Assignment Matrix-X"."Payroll Period":="Assignment Matrix-X"."Payroll Period";
                    "Assignment Matrix-X".VALIDATE("Payroll Period");
                    "Assignment Matrix-X".Type:="Assignment Matrix-X".Type::Deduction;
                    "Assignment Matrix-X".Code:="Assignment Matrix-X".Code;
                    
                    "Assignment Matrix-X".VALIDATE(Code);
                    //"Assignment Matrix-X".Amount:=amt;
                    "Assignment Matrix-X".VALIDATE(Amount);
                    
                    */
                    //"Assignment Matrix-X".INSERT;
                    
                    /*
                     "Assignment Matrix-X".VALIDATE("Employee No");
                     "Assignment Matrix-X".VALIDATE("Payroll Period");
                    
                    "Assignment Matrix-X".Type:="Assignment Matrix-X".Type::Deduction;
                    
                    "Assignment Matrix-X".VALIDATE(Code);
                    "Assignment Matrix-X".Amount:=amt;
                    "Assignment Matrix-X".VALIDATE(Amount);
                    */
                     //"Assignment Matrix-X".INSERT;
                    
                    //END;

                end;

                trigger OnBeforeInsertRecord()
                begin
                    //"Assignment Matrix-X".Type:="Assignment Matrix-X".Type::Deduction;
                    //MESSAGE('%1',"Assignment Matrix-X"."Employee No");
                    //MESSAGE('%1',"Assignment Matrix-X"."Payroll Period");
                    //"Assignment Matrix-X".VALIDATE(Code);
                    // MESSAGE('%1',"Assignment Matrix-X".Code);
                    //"Assignment Matrix-X".Amount:=amt;


                    //"Assignment Matrix-X".VALIDATE(Amount);
                    // MESSAGE('%1',amt);
                    //"Assignment Matrix-X".VALIDATE(Amount);
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

    var
        AssignMatrix: Record "Assignment Matrix-X";
        AssignMatrix2: Record "Assignment Matrix-X";
        HRSetup: Record "Human Resources Setup";
        amt: Decimal;
        Deductions: Record DeductionsX;
        Emp: Record Employee;
        Amnt: Decimal;
}

