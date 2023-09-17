import { TransactionType } from '@prisma/client';
import { Type } from 'class-transformer';
import {
  IsEnum,
  IsNotEmpty,
  IsNumber,
  IsOptional,
  IsUUID,
} from 'class-validator';

export class FindTransactionQueryDto {
  @IsNotEmpty()
  @IsNumber()
  @Type(() => Number)
  month: number;

  @IsNotEmpty()
  @IsNumber()
  @Type(() => Number)
  year: number;

  @IsOptional()
  @IsUUID()
  bankAccountId?: string;

  @IsOptional()
  @IsEnum(TransactionType)
  type?: TransactionType;
}
