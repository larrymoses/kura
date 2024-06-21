#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50120 "tableextension50120" extends "Cause of Absence" 
{
    fields
    {
        field(50000;"Payment Type";Option)
        {
            OptionCaption = ' ,Normal,Public Holiday,Unpaid';
            OptionMembers = " ",Normal,"Public Holiday",Unpaid;
        }
        field(50001;"Number Code";Code[10])
        {
        }
        field(50002;"Branch Filter";Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where ("Dimension Code"=const('BRANCH'));
        }
        field(50003;"Total Count";Integer)
        {
            Caption = 'Total Count';
            Editable = false;
        }
        field(50004;"Total Unchecked";Integer)
        {
            Caption = 'Total Unchecked';
            Editable = false;
        }
        field(50005;"Total Checked";Integer)
        {
            Caption = 'Total Checked';
            Editable = false;
        }
        field(50006;"Paypoint Filter";Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where ("Dimension Code"=const('PAYPOINT'));
        }
        field(50007;"Staffing Group Filter";Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where ("Dimension Code"=const('STAFFINGGRP'));
        }
        field(50008;"Rank Filter";Option)
        {
            FieldClass = FlowFilter;
            OptionCaption = 'GUARD,SITE SUPERVISOR,DRIVER,DOG HANDLER,ADMIN,FIELD OFFICER,SENIOR GUARD,PREMIUM GUARD I,PREMIUM GUARD II,RIDER SUPERVISOR,CREW COMMANDER,CREW';
            OptionMembers = GUARD,"SITE SUPERVISOR",DRIVER,"DOG HANDLER",ADMIN,"FIELD OFFICER","SENIOR GUARD","PREMIUM GUARD I","PREMIUM GUARD II","RIDER SUPERVISOR","CREW COMMANDER",CREW;
        }
        field(50009;"Day Shift Count";Integer)
        {
        }
        field(50010;"Night  Shift Count";Integer)
        {
        }
        field(50011;"Sort Oder";Integer)
        {
        }
        field(50012;"Embassy Hours";Decimal)
        {
        }
    }
}

