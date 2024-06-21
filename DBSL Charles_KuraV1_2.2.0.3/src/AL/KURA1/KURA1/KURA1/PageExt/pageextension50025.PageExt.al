#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50025 "pageextension50025" extends "Resource Card"
{
    layout
    {

        //Unsupported feature: Property Modification (Visible) on ""No."(Control 2)".


        //Unsupported feature: Property Insertion (Visible) on ""Use Time Sheet"(Control 3)".


        //Unsupported feature: Property Insertion (Visible) on ""Time Sheet Owner User ID"(Control 5)".


        //Unsupported feature: Property Insertion (Visible) on ""Time Sheet Approver User ID"(Control 7)".
        addbefore(Blocked)
        {
            field("Region"; Rec."Region ID")
            {
                ApplicationArea = Basic;
            }
            field("Road Planner"; Rec."Road Planner")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Resource Group No.")
        {
            field("Job Group"; Rec."Job Group")
            {
                ApplicationArea = Basic;
            }
        }
           addafter("Time Sheet Approver User ID")
        {
            field(Signature;Rec.Signature)
                {
                    ApplicationArea = Basic, Suite;
               

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord;
                    end;
                }
        }
    }


    //Unsupported feature: Code Insertion on "OnNewRecord".

    //trigger OnNewRecord(BelowxRec: Boolean)
    //begin
    /*
    "Resource Type":="Resource Type"::" ";
    */
    //end;
}

