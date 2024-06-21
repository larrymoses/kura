#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69462 "HSE Plan Emergency Contact"
{
    PageType = Card;
    SourceTable = 69430;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Plan ID"; "Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Line No."; "Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Safety Workgroup ID"; "Safety Workgroup ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Contact Person"; "Contact Person")
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; "Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(Email; Email)
                {
                    ApplicationArea = Basic;
                }
                field(Address; Address)
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}
