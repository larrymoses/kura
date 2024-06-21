#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69080 "Documents E-mailed Log1"
{
    Editable = false;
    PageType = List;
    SourceTable = "Document E-mail Log";

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
                field("S/no";"S/no")
                {
                    ApplicationArea = Basic;
                }
                field("Customer No";"Customer No")
                {
                    ApplicationArea = Basic;
                }
                field("Customer Name";"Customer Name")
                {
                    ApplicationArea = Basic;
                }
                field("E-mailed To";"E-mailed To")
                {
                    ApplicationArea = Basic;
                }
                field(Date;DateSent)
                {
                    ApplicationArea = Basic;
                }
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("File Extension";"File Extension")
                {
                    ApplicationArea = Basic;
                }
                field(Time;Time)
                {
                    ApplicationArea = Basic;
                }
                field("Profit Centre";"Profit Centre")
                {
                    ApplicationArea = Basic;
                }
                field("Branch code";"Branch code")
                {
                    ApplicationArea = Basic;
                }
                field("Sender ID";"Sender ID")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInit()
    begin
        //
    end;
}

