#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75366 "Vendor Beneficiaries"
{
    PageType = List;
    SourceTable = "Vendor Beneficiaries";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field("ID Type";"ID Type")
                {
                    ApplicationArea = Basic;
                }
                field("ID/Passport No.";"ID/Passport No.")
                {
                    ApplicationArea = Basic;
                }
                field("Phone No.";"Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(Email;Email)
                {
                    ApplicationArea = Basic;
                }
                field("Allocated Shares";"Allocated Shares")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control11;Outlook)
            {
            }
            systempart(Control12;Notes)
            {
            }
            systempart(Control13;MyNotes)
            {
            }
            systempart(Control14;Links)
            {
            }
        }
    }

    actions
    {
    }
}

