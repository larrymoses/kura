#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72105 "Payment Red. Calc. Line"
{
    PageType = ListPart;
    SourceTable = "Payment Red. Calc. Line";

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
                field("Project Code";"Project Code")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name";"Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                }
                field(Service;Service)
                {
                    ApplicationArea = Basic;
                }
                field("Service Scope";"Service Scope")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Road Length(km)";"Contract Road Length(km)")
                {
                    ApplicationArea = Basic;
                }
                field("Required Target(%)";"Required Target(%)")
                {
                    ApplicationArea = Basic;
                }
                field("Target Length(Km)";"Target Length(Km)")
                {
                    ApplicationArea = Basic;
                }
                field("Exemption Length(Km)";"Exemption Length(Km)")
                {
                    ApplicationArea = Basic;
                }
                field("Non-Compliant Length(Km)";"Non-Compliant Length(Km)")
                {
                    ApplicationArea = Basic;
                }
                field("Adjusted Non-Compliant Lenth";"Adjusted Non-Compliant Lenth")
                {
                    ApplicationArea = Basic;
                }
                field("Non-Compliant Rate(%)";"Non-Compliant Rate(%)")
                {
                    ApplicationArea = Basic;
                }
                field("Reduction Weight(%)";"Reduction Weight(%)")
                {
                    ApplicationArea = Basic;
                }
                field("Reduction Rate(%)";"Reduction Rate(%)")
                {
                    ApplicationArea = Basic;
                }
                field("Reduction Length(Km)";"Reduction Length(Km)")
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

