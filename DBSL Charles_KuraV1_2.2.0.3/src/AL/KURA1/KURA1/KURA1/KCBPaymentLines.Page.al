#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95320 "KCB Payment Lines"
{
    PageType = ListPart;
    SourceTable = "KCB Payment Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Entry;Entry)
                {
                    ApplicationArea = Basic;
                }
                field("Batch No";"Batch No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                }
                field(Trcode;Trcode)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(DrAccount;DrAccount)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(DrName;DrName)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(DrBnkCode;DrBnkCode)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Payment Narration";"Payment Narration")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(CrAccount;CrAccount)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(CrName;CrName)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(CrBnkCode;CrBnkCode)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Reference;Reference)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Approved;Approved)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    var
        ApprovalEntry: Record "Approval Entry";
}

