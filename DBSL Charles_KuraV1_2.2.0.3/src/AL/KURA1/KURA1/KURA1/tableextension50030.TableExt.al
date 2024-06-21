#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50030 "tableextension50030" extends "Job Ledger Entry"
{
    fields
    {

    

        field(72000; "Road Code"; Code[30])
        {
            
            //TableRelation = "Road Inventory"."Road Code";
        }
        field(72001; "Road Section No"; Code[20])
        {
            
            //TableRelation = "Road Section"."Road Section No." whe("Road Code" = "=field("Road Code"));
        }
        field(72002; "Constituency ID"; Code[30])
        {
            
            TableRelation = Constituency.Code;
        }
        field(72003; "County ID"; Code[40])
        {
            
            TableRelation = County1.Code;
        }
        field(72004; "Region ID"; Code[40])
        {
            
            TableRelation = County1.Code;
        }
        field(72005; "Road Project Category"; Option)
        {
            
            OptionCaption = ',Studies and Surveys,Construction Works,Maitenance Works';
            OptionMembers = ,"Studies and Surveys","Construction Works","Maitenance Works";
        }
        field(72006; "Project No."; Code[50])
        {
            
        }
    }


    //Unsupported feature: Code Insertion (VariableCollection) on "OnInsert".

    //trigger (Variable: GenJnlPostPreview)()
    //Parameters and return type have not been exported.
    //begin
    /*
    */
    //end;


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    Job.UpdateOverBudgetValue("Job No.",TRUE,"Total Cost (LCY)");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    Job.UpdateOverBudgetValue("Job No.",TRUE,"Total Cost (LCY)");
    //GenJnlPostPreview.SaveJobLedgEntry(Rec);
    */
    //end;

    var
        GenJnlPostPreview: Codeunit "Gen. Jnl.-Post Preview";
}

