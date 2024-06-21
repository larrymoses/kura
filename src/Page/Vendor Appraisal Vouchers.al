page 75451 "Vendor Appraisal Vouchers"
{
    CardPageID = "Vendor Appraisal Voucher";
    PageType = List;
    SourceTable = "Vendor Appraisal Voucher";
    DeleteAllowed =false;
    PromotedActionCategories = 'New,Process,Report,Request Approval,Notify,Post,Navigate';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No";Rec."Document No")
                {
                    ApplicationArea =Basic;
                }
                field("Document Date";Rec."Document Date")
                {
                    ApplicationArea =Basic;
                }
                field("Vendor No.";Rec."Vendor No.")
                {
                    ApplicationArea =Basic;
                }
                field("Vendor Name";Rec."Vendor Name")
                {
                    ApplicationArea =Basic;
                }
                field("Appraisal Period";Rec."Appraisal Period")
                {
                    ApplicationArea =Basic;
                }
                field("Tendor Category";Rec."Tendor Category")
                {
                    ApplicationArea =Basic;
                }
                field("Evaluation Template";Rec."Evaluation Template")
                {
                    ApplicationArea =Basic;
                }
                field(Posted;Rec.Posted)
                {
                    ApplicationArea =Basic;
                }
                field("Approval Status";Rec."Approval Status")
                {
                    ApplicationArea =Basic;
                }
                field("Created By";Rec."Created By")
                {
                    ApplicationArea =Basic;
                }
            }
        }
    }

    actions
    {
    }
}

