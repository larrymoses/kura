#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 70112 "Disposal Bidders"
{
    PageType = List;
    SourceTable = "Disposal Bidders";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                // Editable = Editable;
                field("Disposal No."; "Disposal No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Name; Name)
                {
                    ApplicationArea = Basic;
                }
                field("Email Address"; "Email Address")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; "Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Contact Person"; "Contact Person")
                {
                    ApplicationArea = Basic;
                }
                field("Physical Addess"; "Physical Addess")
                {
                    ApplicationArea = Basic;
                }
                field(Award; Award)
                {
                    ApplicationArea = Basic;

                    // trigger OnValidate()
                    // begin
                    //      DisposalBidders.Reset;
                    //      DisposalBidders.SetRange("Disposal No.",Rec."Disposal No.");
                    //      DisposalBidders.SetRange(Award,true);
                    //      if DisposalBidders.FindFirst then
                    //       if DisposalBidders.Count=1 then
                    //         AwardEditable:=false;
                    // end;
                }
            }
        }
    }
}