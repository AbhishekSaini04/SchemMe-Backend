import { GoogleGenerativeAI } from "@google/generative-ai";

// Initialize once (can be reused across files)
const genAI = new GoogleGenerativeAI(process.env.GEMINI_API_KEY!);

export async function chatBOT(prompt: string): Promise<string> {
console.log('====================================');
console.log(prompt);
console.log('====================================');
  try {
    const model = genAI.getGenerativeModel({
      model: "gemini-2.5-flash",
    });

    const result = await model.generateContent(
      prompt +
        " is this prompt about a government scheme? if yes just return true else false, thats it",
    );
    const response = await result.response;

    if (response.text().toLowerCase().includes("true")) {
      const result = await model.generateContent(prompt);
        return await result.response.text();
    }

    return "Can't help with this query. Please ask about government schemes.";
  } catch (error: any) {
    if (error.message?.includes("404")) {
      console.error("Model not found. Listing available models...");
    } else {
      console.error("Error:", error.message);
    }
    throw error;
  }
}
