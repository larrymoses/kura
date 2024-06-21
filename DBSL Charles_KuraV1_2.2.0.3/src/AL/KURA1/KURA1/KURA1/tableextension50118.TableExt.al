#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50118 "tableextension50118" extends Qualification 
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on "Code(Field 1)".

        field(4;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Educational,Professional,Body,Membership,Leadership,Supervisory,Management,Licence';
            OptionMembers = Educational,Professional,Body,Membership,Leadership,Supervisory,Management,Licence;
        }
        field(69600;"Qualification Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Academic,Professional,Skills & Competencies,Experience,Ethics & Integrity,Physical Attributes,Proffessional Bodies';
            OptionMembers = ,Academic,Professional,"Skills & Competencies",Experience,"Ethics & Integrity","Physical Attributes","Proffessional Bodies";
        }
        field(69601;"Academic Hierachy Code";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(69602;"No. of Active Employees";Integer)
        {
            CalcFormula = count("Employee Qualification" where ("Qualification Code"=field(Code)));
            FieldClass = FlowField;
        }
        field(69603;"No. of Qualified Applicants";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(69604;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
}

