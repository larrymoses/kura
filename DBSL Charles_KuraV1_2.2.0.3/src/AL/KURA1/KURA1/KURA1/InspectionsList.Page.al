#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 70055 "Inspections List"
{
    ApplicationArea = Basic;
    CardPageID = "Inspection Header";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Inspection Header1";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Inspection No";"Inspection No")
                {
                    ApplicationArea = Basic;
                }
                field("Contract/Order No";"Contract/Order No")
                {
                    ApplicationArea = Basic;
                }
                field("Commitee Appointment No";"Commitee Appointment No")
                {
                    ApplicationArea = Basic;
                }
                field("Inspection Date";"Inspection Date")
                {
                    ApplicationArea = Basic;
                }
                field("Supplier Name";"Supplier Name")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center";"Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series";"No. Series")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        // UserSetup.RESET;
        // UserSetup.SETRANGE("User ID",USERID);
        // IF UserSetup.FIND('-') THEN BEGIN
        //   SETFILTER("Responsibility Center","Responsibility Center");
        // END;

        //Fred RC
        FnGetUserRC();//NICK
    end;

    var
        UserSetup: Record "User Setup";


    procedure FnGetUserRC()
    begin
        if UserSetup.Get(UserId) then begin
        SetRange("Responsibility Center",UserSetup."Responsibility Center");
        end;
    end;
}

