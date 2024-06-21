#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75252 "Tender Addendum Bidder"
{
    PageType = List;
    SourceTable = "Tender Addendum Bidder";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Addendum Notice No.";"Addendum Notice No.")
                {
                    ApplicationArea = Basic;
                }
                field("IFS No.";"IFS No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No.";"Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Name";"Vendor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Email";"Primary Email")
                {
                    ApplicationArea = Basic;
                }
                field("Addendum e-Notice Sent";"Addendum e-Notice Sent")
                {
                    ApplicationArea = Basic;
                }
                field("e-Notice Sent Date/Time";"e-Notice Sent Date/Time")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(ActionGroup11)
            {
                action("Suggest Intention-To-Bid Vendors")
                {
                    ApplicationArea = Basic;

                    trigger OnAction()
                    begin
                        TenderAddendum.Reset;
                        TenderAddendum.SetRange("Addendum Notice No.","Addendum Notice No.");
                        if TenderAddendum.FindSet then
                        Procurement.suggestIntentionToBidVends(TenderAddendum);
                    end;
                }
                action("Send Addendum e-Notice")
                {
                    ApplicationArea = Basic;

                    trigger OnAction()
                    begin
                        TenderAddendum.Reset;
                        TenderAddendum.SetRange("Addendum Notice No.","Addendum Notice No.");
                        if TenderAddendum.FindSet then
                        Procurement.SendAddendumNotice(TenderAddendum);
                    end;
                }
            }
        }
    }

    var
        Procurement: Codeunit "Procurement Processing";
        TenderAddendum: Record "Tender Addendum Notice";
}

