using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;

namespace lera1
{
    class Program
    {
        static string swapText(string sContent)
        {
            string search = @"bank\w*";
            MatchCollection matches = Regex.Matches(sContent, search);
            int numberOfProccessedWords = 0;
            foreach (Match match in matches)
            {
                int index = match.Index;
                int indexEnd = index + match.Length-1;

                int realIndex = index + (7 * numberOfProccessedWords);
                int realIndexEnd = indexEnd + (7 * numberOfProccessedWords);


                string split = sContent.Substring(realIndex, match.Length);
                string str = "<b>" + split + "</b>";

                sContent = sContent.Substring(0, realIndex) + str + sContent.Substring(realIndexEnd+1);
                
                numberOfProccessedWords++;

            }
            return sContent;
        }
        static void Main(string[] args)
        {

            string sContent = "»Izpolnite vlogo za zamenjavo banke (pdf), s katero lahko pooblastite banko, da v vašem imenu odpove pogodbo z drugo banko, in tako zapre račun pri drugi banki. Ko bomo od vaše prejšnje banke prejeli podatke o vaših trajnikih in direktnih obremenitvah, se bomo z vami dogovorili za način poravnavanja obveznosti. Po odprtju trajnikov in direktnih obremenitev obvestila upnike in vašemu delodajalcu sporočila novo številko računa.«";
            Console.WriteLine(swapText(sContent));

        }
    }
}
