#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50119 "tableextension50119" extends "Employee Qualification" 
{
    fields
    {

        //Unsupported feature: Property Insertion (AutoIncrement) on ""Line No."(Field 2)".

        field(14;Year;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15;Specialization;Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {

        //Unsupported feature: Deletion (KeyCollection) on ""Qualification Code"(Key)".

    }
}

