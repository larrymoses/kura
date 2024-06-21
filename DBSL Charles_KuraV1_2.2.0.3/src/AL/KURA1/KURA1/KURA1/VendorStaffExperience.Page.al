#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75039 "Vendor Staff Experience"
{
    PageType = List;
    SourceTable = "Vendor Staff Experience";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No";"Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Staff ID";"Staff ID")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No";"Vendor No")
                {
                    ApplicationArea = Basic;
                }
                field("Experience Category";"Experience Category")
                {
                    ApplicationArea = Basic;
                }
                field("Experience Summary";"Experience Summary")
                {
                    ApplicationArea = Basic;
                }
                field("Assignment Description";"Assignment Description")
                {
                    ApplicationArea = Basic;
                }
                field("Years of Experience";"Years of Experience")
                {
                    ApplicationArea = Basic;
                }
                field("Start Year";"Start Year")
                {
                    ApplicationArea = Basic;
                }
                field("End Year";"End Year")
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

