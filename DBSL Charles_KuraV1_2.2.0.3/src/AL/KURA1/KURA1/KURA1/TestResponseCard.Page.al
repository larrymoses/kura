#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69798 "Test Response Card"
{
    Caption = 'Test Response Card';
    PageType = Card;
    SourceTable = "Ability Test Response";

    layout
    {
        area(content)
        {
            group(Group)
            {
                field("Application No.";"Application No.")
                {
                    ApplicationArea = Basic;
                }
                field("First Name";"First Name")
                {
                    ApplicationArea = Basic;
                }
                field("Middle Name";"Middle Name")
                {
                    ApplicationArea = Basic;
                }
                field("Last Name";"Last Name")
                {
                    ApplicationArea = Basic;
                }
                field(Email;Email)
                {
                    ApplicationArea = Basic;
                }
                field("Test Date";"Test Date")
                {
                    ApplicationArea = Basic;
                }
                field("Test Start Time";"Test Start Time")
                {
                    ApplicationArea = Basic;
                }
                field("Test End Time";"Test End Time")
                {
                    ApplicationArea = Basic;
                }
                field("Total No. of Questions";"Total No. of Questions")
                {
                    ApplicationArea = Basic;
                }
                field("Total No. of Pass Questions";"Total No. of Pass Questions")
                {
                    ApplicationArea = Basic;
                }
                field("Ability Test Pass Score %";"Ability Test Pass Score %")
                {
                    ApplicationArea = Basic;
                }
                field("Response Status";"Response Status")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control6;"Test Responses")
            {
                SubPageLink = "Response ID"=field("Response ID");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Print Perfomance Report")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    SetRange("Response ID","Response ID");
                    Report.Run(69621,true,false,Rec);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        CalcFields("Total No. of Pass Questions","Total No. of Questions");
        if "Total No. of Questions">0 then
        "Ability Test Pass Score %":=("Total No. of Pass Questions"/"Total No. of Questions")*100;
    end;
}

